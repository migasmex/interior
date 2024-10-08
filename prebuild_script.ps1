$FLUTTER_PUB_SPEC = "pubspec.yaml"
$PRE_BUILD_SCRIPT = "pre_build_script.ps1"

$MAX_SEARCH_DEPTH = 3

# Flags
$NO_GET = $false
$ONLY_DIR = $null

$argIndex = 0
while ($argIndex -lt $args.Length) {
    switch ($args[$argIndex]) {
        {"-ng", "--no-get"} {
            $NO_GET = $true
            $argIndex++
        }
        {"-o", "--only"} {
            $ONLY_DIR = $args[$argIndex]
            $argIndex++
        }
        default {
            $argIndex++
        }
    }
}

# Function to run the script in all dirs
function Run-AllDirs {
    $dirs = @()
    Get-ChildItem -Recurse -Depth $MAX_SEARCH_DEPTH -Filter $FLUTTER_PUB_SPEC | ForEach-Object {
        $dir = $_.DirectoryName
        if ($dirs -notcontains $dir -and $null -eq $ONLY_DIR -or $dir -like "*\$ONLY_DIR") {
            $dirs += $dir
        }
    }

    $index = 0
    $totalNumber = $dirs.Length
    foreach ($dir in $dirs) {
        $index++
        Run-PreBuild $dir $index $totalNumber
    }
}

# Function to run the pre-build script
function Run-PreBuild {
    param (
        [string]$dir,
        [int]$index,
        [int]$totalNumber
    )

    Write-Host "[$index/$totalNumber] run in $dir"
    Set-Location -Path $dir

    if (-not $NO_GET) {
        fvm flutter clean
        fvm flutter pub get
    }

    if ($dir -ne $PSScriptRoot -and (Test-Path -Path (Join-Path $dir $PRE_BUILD_SCRIPT) -PathType Leaf)) {
        $dirPreBuildScriptPath = Join-Path -Path $dir -ChildPath $PRE_BUILD_SCRIPT
        . $dirPreBuildScriptPath
    }

    Set-Location -Path $PSScriptRoot
}

Measure-Command {
    Run-AllDirs
}  | Select-Object @{n="Pre build made in: ";e={$_.TotalSeconds,"s" -join " "}}