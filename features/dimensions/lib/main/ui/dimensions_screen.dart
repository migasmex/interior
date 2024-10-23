import 'package:auto_route/annotations.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/dimensions_cubit.dart';

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
    return BlocProvider(
      create: (context) => DimensionsCubit(),
      child: BlocConsumer<DimensionsCubit, DimensionsState>(
        listener: (context, state) {
          if (state is ItemFitState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          } else if (state is ItemFitFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
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
                    Text(
                      'Length: ${room.length}',
                      style: AppFonts.boldWhiteText,
                    ),
                    Text(
                      'Width: ${room.width}',
                      style: AppFonts.boldWhiteText,
                    ),
                    Text(
                      'Height: ${room.height}',
                      style: AppFonts.boldWhiteText,
                    ),
                    const SizedBox(
                      height: AppDimens.PADDING_10,
                    ),
                    Text(
                      'Enter item dimensions',
                      style: AppFonts.boldWhiteText,
                    ),
                    const SizedBox(
                      height: AppDimens.PADDING_16,
                    ),
                    CustomTextField(
                      label: 'Height:',
                      controller: itemHeightController,
                    ),
                    CustomTextField(
                      label: 'Width:',
                      controller: itemWidthController,
                    ),
                    CustomTextField(
                      label: 'Length:',
                      controller: itemLengthController,
                    ),
                    const SizedBox(height: AppDimens.PADDING_20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colors.lightBlueColor,
                        fixedSize: const Size.fromWidth(200),
                      ),
                      onPressed: () {
                        final double itemLength =
                            double.tryParse(itemLengthController.text) ?? 0.0;
                        final double itemWidth =
                            double.tryParse(itemWidthController.text) ?? 0.0;
                        final double itemHeight =
                            double.tryParse(itemHeightController.text) ?? 0.0;
                        context.read<DimensionsCubit>().checkDimensions(
                              room: room,
                              itemLength: itemLength,
                              itemWidth: itemWidth,
                              itemHeight: itemHeight,
                            );
                        print(
                            'Item dimensions: length=$itemLength, width=$itemWidth, height=$itemHeight');
                      },
                      child: Text(
                        'Check',
                        style: AppFonts.boldWhiteText,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
  });

  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final AppColors colors = AppColors.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimens.PADDING_16),
      child: SizedBox(
        width: 300,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: colors.white),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                width: 2,
                color: colors.lightBlueColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                width: 2,
                color: colors.lightBlueColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                width: 2,
                color: colors.lightBlueColor,
              ),
            ),
          ),
          style: TextStyle(color: colors.white),
        ),
      ),
    );
  }
}
