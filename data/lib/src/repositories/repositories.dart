import 'package:domain/domain.dart';

class MockUserRepository implements UserRepository {
  List<User> users = [
    User(id: 1, name: 'Ilya', email: 'ilya@gmail.com', imageUrl: 'some_url'),
    User(id: 2, name: 'Vlad', email: 'vlad@gmail.com', imageUrl: 'some_url'),
    User(
        id: 3, name: 'Alexey', email: 'alexey@gmail.com', imageUrl: 'some_url'),
  ];

  @override
  Future<List<User>> getAllUsers() async {
    return users;
  }

  @override
  Future<User> getUser(int id) async {
    return users.firstWhere((user) => user.id == id);
  }
}

class MockRoomRepository implements RoomRepository {
  final List<Room> rooms = [
    Room(name: 'Bedroom', height: 300, width: 900, length: 1200),
    Room(name: 'Kitchen', height: 300, width: 500, length: 800),
    Room(name: 'Bathroom', height: 300, width: 400, length: 500),
  ];

  @override
  Future<void> addRoom(Room room) async {
    rooms.add(room);
  }

  @override
  Future<Room> getRoomDimensions(String name) async {
    return rooms.firstWhere((room) => room.name == name);
  }

  @override
  Future<List<Room>> getAllRooms() async {
    return rooms;
  }
}
