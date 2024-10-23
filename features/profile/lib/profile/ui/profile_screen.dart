import 'package:auto_route/annotations.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../bloc/profile_cubit.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final getUserUseCase = GetIt.instance<GetUserUseCase>();
    final AppColors colors = AppColors.of(context);

    return BlocProvider(
      create: (context) =>
          ProfileCubit(getUserUseCase: getUserUseCase)..readUserData(2),
      child: Scaffold(
        backgroundColor: colors.primaryColor,
        appBar: AppBar(
          centerTitle: true,
          title: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileDataLoaded) {
                return Text(
                  state.user.name,
                  style: AppFonts.boldWhiteText.copyWith(
                    fontSize: 24,
                  ),
                );
              }
              return const Text('Unknown');
            },
          ),
          backgroundColor: colors.primaryColor,
          elevation: 0,
        ),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileDataLoaded) {
              final user = state.user;
              return Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 90,
                      backgroundImage: NetworkImage(
                        user.imageUrl,
                      ),
                    ),
                    const SizedBox(
                      height: AppDimens.PADDING_16,
                    ),
                    Text(
                      'Edit Profile',
                      style: AppFonts.boldWhiteText.copyWith(
                        fontSize: 16,
                        color: colors.white.withOpacity(
                          0.6,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: AppDimens.PADDING_32,
                    ),
                    CustomLabel(
                      textStyle: AppFonts.boldWhiteText,
                      label: 'Full name',
                      info: user.name,
                    ),
                    CustomLabel(
                      textStyle: AppFonts.boldWhiteText,
                      label: 'Email',
                      info: user.email,
                    )
                  ],
                ),
              );
            }
            return Center(
              child: Text(
                'No data',
                style: AppFonts.boldWhiteText,
              ),
            );
          },
        ),
      ),
    );
  }
}

class CustomLabel extends StatelessWidget {
  const CustomLabel({
    super.key,
    required this.textStyle,
    required this.label,
    required this.info,
  });

  final TextStyle textStyle;
  final String label;
  final String info;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.PADDING_8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: AppFonts.boldWhiteText,
            ),
            Text(
              info,
              style: AppFonts.boldWhiteText.copyWith(
                color: Colors.white.withOpacity(0.6),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
