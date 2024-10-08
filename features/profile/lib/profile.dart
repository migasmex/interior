import 'package:auto_route/annotations.dart';

import 'profile.gm.dart';

export 'package:profile/profile.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen|Dialog,Route')
class ProfileModule extends $ProfileModule {}
