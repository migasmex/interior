import 'package:auto_route/annotations.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DimensionsScreen extends StatelessWidget {
  DimensionsScreen({super.key, required this.room});

  final Room room;

  final TextEditingController itemHeightController = TextEditingController();

  final TextEditingController itemWidthController = TextEditingController();

  final TextEditingController itemLengthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AppColors colors = AppColors.of(context);
    return Scaffold(
        backgroundColor: colors.primaryColor,
        appBar: AppBar(
          backgroundColor: colors.primaryColor,
          centerTitle: true,
          title: Text(
            room.name,
            style: AppFonts.boldWhiteText.copyWith(fontSize: 24),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Text('Length: ${room.length}', style: AppFonts.boldWhiteText),
                Text('Width: ${room.width}', style: AppFonts.boldWhiteText),
                Text('Height: ${room.height}', style: AppFonts.boldWhiteText),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Enter item dimensions',
                  style: AppFonts.boldWhiteText,
                ),
                const SizedBox(height: AppDimens.PADDING_16),
                CustomTextField(
                    label: "Height:", contoller: itemHeightController),
                CustomTextField(
                    label: "Width:", contoller: itemWidthController),
                CustomTextField(
                    label: "Length:", contoller: itemLengthController),
                const SizedBox(height: AppDimens.PADDING_20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: colors.lightBlueColor,
                        fixedSize: const Size.fromWidth(200)),
                    onPressed: () {},
                    child: Text(
                      "Check",
                      style: AppFonts.boldWhiteText,
                    ))
              ],
            ),
          ),
        ));
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.label, required this.contoller});

  final String label;
  final TextEditingController contoller;

  @override
  Widget build(BuildContext context) {
    final AppColors colors = AppColors.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimens.PADDING_16),
      child: SizedBox(
        width: 300,
        child: TextField(
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: colors.white),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(width: 2, color: colors.lightBlueColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(width: 2, color: colors.lightBlueColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(width: 2, color: colors.lightBlueColor),
            ),
          ),
          style: TextStyle(color: colors.white),
        ),
      ),
    );
  }
}
