import '../../domain.dart';

class GetRoomUseCase {
  final RoomRepository roomRepository;

  GetRoomUseCase({
    required this.roomRepository,
  });

  Future<Room> execute(String name) {
    return roomRepository.getRoomDimensions(name);
  }
}

class GetAllRoomsUseCase {
  final RoomRepository roomRepository;

  GetAllRoomsUseCase({
    required this.roomRepository,
  });

  Future<List<Room>> execute() {
    return roomRepository.getAllRooms();
  }
}

class AddRoomUseCase {
  final RoomRepository roomRepository;

  AddRoomUseCase({
    required this.roomRepository,
  });

  Future<void> execute(Room room) async {
    return roomRepository.addRoom(room);
  }
}
