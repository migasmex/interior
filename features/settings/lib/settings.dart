import 'package:auto_route/annotations.dart';

import 'settings.gm.dart';

export 'package:settings/settings.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen|Dialog,Route')
class SettingsModule extends $SettingsModule {}
