import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'package:rooms/rooms/bloc/rooms_state.dart';

class RoomCubit extends Cubit<RoomState> {
  final GetAllRoomsUseCase getAllRoomsUseCase;
  final AddRoomUseCase addRoomUseCase;

  RoomCubit({
    required this.addRoomUseCase,
    required this.getAllRoomsUseCase,
  }) : super(RoomInitial());

  Future<void> fetchRooms() async {
    try {
      emit(RoomLoading());
      final List<Room> rooms = await getAllRoomsUseCase.execute();

      emit(RoomLoaded(rooms: rooms));
    } catch (e) {
      emit(RoomLoadingFailure('Failed'));
    }
  }

  Future<void> addRoom(Room room) async {
    try {
      await addRoomUseCase.execute(room);
      await fetchRooms();
    } catch (e) {
      emit(RoomLoadingFailure('failed to add'));
    }
  }
}
