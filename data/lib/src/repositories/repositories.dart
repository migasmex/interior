import 'package:domain/domain.dart';

class MockUserRepository implements UserRepository {
  List<User> users = [
    User(
      id: 1,
      name: 'Ilya',
      email: 'ilya@gmail.com',
      imageUrl:
          'https://www.rbc.ua/static/img/3/4/346835624_640815074748586_1581085115056687432_n_2c2f85e05ad00b4a37aa1c57ec51b025_1200x675.jpg',
    ),
    User(
      id: 2,
      name: 'Vlad',
      email: 'vlad@gmail.com',
      imageUrl:
          'https://vostokmedia.com/attachments/0b7f826c548a4ce016b7fbd976863051867087bd/store/crop/0/-1/1920/1080/500/0/0/67ae9f46362b1cdedf4177ec76f46616e2d754e2ffcfda3699f4e51adf73/1721631598961.jpg',
    ),
    User(
      id: 3,
      name: 'Alexey',
      email: 'alexey@gmail.com',
      imageUrl:
          'https://cs14.pikabu.ru/post_img/2023/02/22/0/1677015600221783204.jpg',
    ),
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
    Room(
      name: 'Bedroom',
      height: 300,
      width: 900,
      length: 1200,
    ),
    Room(
      name: 'Kitchen',
      height: 300,
      width: 500,
      length: 800,
    ),
    Room(
      name: 'Bathroom',
      height: 300,
      width: 400,
      length: 500,
    ),
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
