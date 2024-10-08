import 'package:auto_route/annotations.dart';

import 'main.gm.dart';

export 'package:main/main.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen|Dialog,Route')
class MainModule extends $MainModule {}
