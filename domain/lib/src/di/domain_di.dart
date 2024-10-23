import 'package:core/core.dart';

import '../../domain.dart';

abstract class DomainDI {
  static void initDependencies(GetIt locator) {
    _initUseCases(locator);
  }

  static void _initUseCases(GetIt locator) {
    locator.registerLazySingleton<GetAllRoomsUseCase>(
      () => GetAllRoomsUseCase(roomRepository: locator<RoomRepository>()),
    );

    locator.registerLazySingleton<GetRoomUseCase>(
      () => GetRoomUseCase(roomRepository: locator<RoomRepository>()),
    );

    locator.registerLazySingleton<AddRoomUseCase>(
      () => AddRoomUseCase(roomRepository: locator<RoomRepository>()),
    );

    locator.registerLazySingleton<GetUserUseCase>(
      () => GetUserUseCase(userRepository: locator<UserRepository>()),
    );

    locator.registerLazySingleton<GetAllUsersUseCase>(
      () => GetAllUsersUseCase(userRepository: locator<UserRepository>()),
    );
  }
}
