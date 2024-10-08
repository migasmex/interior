import 'package:auto_route/annotations.dart';

import 'rooms.gm.dart';

export 'package:rooms/rooms.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen|Dialog,Route')
class RoomsModule extends $RoomsModule {}
