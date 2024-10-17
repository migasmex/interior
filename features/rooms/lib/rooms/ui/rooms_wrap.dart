import 'package:auto_route/annotations.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/rooms_cubit.dart';
import 'rooms_screen.dart';

@RoutePage()
class WrapperScreen extends StatelessWidget {
  const WrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final roomRepository = MockRoomRepository();

    final getAllRoomsUseCase =
        GetAllRoomsUseCase(roomRepository: roomRepository);
    final addRoomUseCase = AddRoomUseCase(roomRepository: roomRepository);

    return BlocProvider(
      create: (context) => RoomCubit(
        addRoomUseCase: addRoomUseCase,
        getAllRoomsUseCase: getAllRoomsUseCase,
      )..fetchRooms(),
      child: const RoomsScreen(),
    );
  }
}
