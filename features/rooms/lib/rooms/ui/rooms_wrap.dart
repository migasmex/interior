import 'package:auto_route/annotations.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../bloc/rooms_cubit.dart';
import 'rooms_screen.dart';

@RoutePage()
class WrapperScreen extends StatelessWidget {
  const WrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final getAllRoomsUseCase = GetIt.instance<GetAllRoomsUseCase>();

    final addRoomUseCase = GetIt.instance<AddRoomUseCase>();

    return BlocProvider(
      create: (context) => RoomCubit(
        addRoomUseCase: addRoomUseCase,
        getAllRoomsUseCase: getAllRoomsUseCase,
      )..fetchRooms(),
      child: const RoomsScreen(),
    );
  }
}
