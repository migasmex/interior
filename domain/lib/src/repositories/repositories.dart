import '../../domain.dart';

abstract class UserRepository {
  Future<User> getUser(int id);

  Future<List<User>> getAllUsers();
}

abstract class RoomRepository {
  Future<Room> getRoomDimensions(String name);

  Future<List<Room>> getAllRooms();

  Future<void> addRoom(Room room);
}
