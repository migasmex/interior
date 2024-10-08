import "package:flutter_bloc/flutter_bloc.dart";

part 'package:rooms/rooms/bloc/rooms_state.dart';

class RoomCubit extends Cubit<RoomState> {
  List<String> rooms = [];

  RoomCubit() : super(RoomInitial());

  void addRoom(String roomName) {
    rooms.add(roomName);
    emit(RoomAdded(List<String>.from(rooms)));
  }
}
