part of 'package:profile/profile/bloc/profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileDataLoaded extends ProfileState {
  final User user;

  ProfileDataLoaded({required this.user});
}

class ProfileDataLoadingFailure extends ProfileState {
  final String message;

  ProfileDataLoadingFailure(this.message);
}
