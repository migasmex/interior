part of 'package:rooms/rooms/bloc/rooms_cubit.dart';

abstract class RoomState {}

class RoomInitial extends RoomState {}

class RoomAdded extends RoomState {
  final List<String> rooms;

  RoomAdded(this.rooms);
}
