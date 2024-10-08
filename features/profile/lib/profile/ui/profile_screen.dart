import 'package:auto_route/annotations.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColors colors = AppColors.of(context);
    return Scaffold(
      backgroundColor: colors.primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Nickname',
            style: AppFonts.boldWhiteText.copyWith(fontSize: 24)),
        backgroundColor: colors.primaryColor,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            const CircleAvatar(
              radius: 90,
              backgroundImage: NetworkImage(
                  'https://masterpiecer-images.s3.yandex.net/578a963b594a11ee927d363fac71b015:upscaled'),
            ),
            const SizedBox(height: 16),
            Text('Edit Profile',
                style: AppFonts.boldWhiteText.copyWith(
                  fontSize: 16,
                  color: colors.white.withOpacity(0.6),
                )),
            const SizedBox(height: 32),
            CustomLabel(
                textStyle: AppFonts.boldWhiteText,
                label: 'Full name',
                info: 'Name'),
            CustomLabel(
                textStyle: AppFonts.boldWhiteText,
                label: 'Email',
                info: 'Email')
          ],
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
            Text(label, style: AppFonts.boldWhiteText),
            Text(
              info,
              style: AppFonts.boldWhiteText.copyWith(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
