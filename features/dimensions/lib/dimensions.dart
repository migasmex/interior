import 'package:auto_route/annotations.dart';

import 'dimensions.gm.dart';

export 'package:dimensions/dimensions.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen|Dialog,Route')
class DimensionsModule extends $DimensionsModule {}
