part of 'package:rooms/rooms/bloc/rooms_cubit.dart';

abstract class RoomState {}

class RoomInitial extends RoomState {}

class RoomLoading extends RoomState {}

class RoomLoaded extends RoomState {
  final List<Room> rooms;

  RoomLoaded({required this.rooms});

  RoomLoaded copyWith({
    List<Room>? rooms,
  }) {
    return RoomLoaded(
      rooms: rooms ?? this.rooms,
    );
  }
}

class RoomLoadingFailure extends RoomState {
  final String message;

  RoomLoadingFailure(this.message);
}
