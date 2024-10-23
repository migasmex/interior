import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'package:profile/profile/bloc/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetUserUseCase getUserUseCase;

  ProfileCubit({
    required this.getUserUseCase,
  }) : super(ProfileInitial());

  Future<void> readUserData(int userId) async {
    try {
      final user = await getUserUseCase.execute(userId);
      emit(ProfileDataLoaded(user: user));
    } catch (e) {
      emit(ProfileDataLoadingFailure(''));
    }
  }
}
