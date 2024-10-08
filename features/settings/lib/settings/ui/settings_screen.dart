import 'package:auto_route/annotations.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColors colors = AppColors.of(context);
    return Scaffold(
      backgroundColor: colors.primaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colors.primaryColor,
        title: Text(
          'Settings',
          style: AppFonts.boldWhiteText.copyWith(fontSize: 24),
        ),
      ),
      body: Column(
        children: [
          CustomRow(
            label: 'Dark mode',
            textStyle: AppFonts.boldWhiteText,
          ),
          const SizedBox(height: 10),
          CustomRow(
            textStyle: AppFonts.boldWhiteText,
            label: 'Increase font',
          ),
        ],
      ),
    );
  }
}

class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
    required this.textStyle,
    required this.label,
  });

  final TextStyle textStyle;
  final String label;

  @override
  Widget build(BuildContext context) {
    final AppColors colors = AppColors.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.PADDING_20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: textStyle),
          Switch(
            inactiveThumbColor: colors.white,
            inactiveTrackColor: colors.lightBlueColor,
            activeTrackColor: colors.lightBlueColor,
            value: false,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
