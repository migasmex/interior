import '../../domain.dart';

abstract class UseCase<Input, Output> {
  Output execute(Input input);
}

abstract class FutureUseCase<Input, Output> {
  Future<Output> execute(Input input);
}

abstract class StreamUseCase<Input, Output> {
  Stream<Output> execute(Input input);
}

class NoParams {
  const NoParams();
}

class GetUserUseCase {
  final UserRepository userRepository;

  GetUserUseCase({
    required this.userRepository,
  });

  Future<User> execute(int id) {
    return userRepository.getUser(id);
  }
}

class GetAllUsersUseCase {
  final UserRepository userRepository;

  GetAllUsersUseCase({
    required this.userRepository,
  });

  Future<List<User>> execute() {
    return userRepository.getAllUsers();
  }
}

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
