import '../../domain.dart';

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
