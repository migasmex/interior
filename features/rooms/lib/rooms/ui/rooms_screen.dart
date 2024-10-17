import 'package:auto_route/auto_route.dart';
import 'package:core_ui/core_ui.dart';
import 'package:dimensions/dimensions.gm.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/rooms_cubit.dart';

class RoomsScreen extends StatefulWidget {
  const RoomsScreen({super.key});

  @override
  State<RoomsScreen> createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  // final List<String> rooms = [];

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppColors colors = AppColors.of(context);
    return Scaffold(
      backgroundColor: colors.primaryColor,
      appBar: AppBar(
        title: Text(
          'Your rooms',
          style: AppFonts.boldWhiteText.copyWith(fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: colors.primaryColor,
        elevation: 0,
      ),
      body: BlocBuilder<RoomCubit, RoomState>(
        builder: (context, state) {
          if (state is RoomLoaded) {
            return ListView.separated(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppDimens.PADDING_28),
              itemBuilder: (context, index) {
                final room = state.rooms[index];
                return GestureDetector(
                  onTap: () {
                    context.router.push(DimensionsRoute(room: room));
                  },
                  child: Container(
                    height: 80,
                    width: 240,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: colors.lightBlueColor,
                    ),
                    child: Center(
                      child: Text(
                        state.rooms[index].name,
                        style: AppFonts.boldWhiteText,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
              itemCount: state.rooms.length,
            );
          } else if (state is RoomInitial) {
            return const Center(
              child: Text('No rooms added yet.'),
            );
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addRoomShowDialog(context);
        },
        backgroundColor: colors.lightBlueColor,
        child: Icon(
          Icons.add,
          color: colors.white,
        ),
      ),
    );
  }

  void addRoomShowDialog(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final AppColors colors = AppColors.of(context);

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(
            'Add your room',
            style: TextStyle(color: colors.blackColor),
          ),
          content: TextField(
            style: TextStyle(color: colors.blackColor),
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Enter a room name',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colors.blackColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colors.blackColor),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop,
              child: Text(
                'Cancel',
                style: TextStyle(color: colors.blackColor),
              ),
            ),
            TextButton(
              onPressed: () {
                final roomName = controller.text;
                if (roomName.isNotEmpty) {
                  final roomCubit = context.read<RoomCubit>();
                  final newRoom = Room(
                    name: roomName,
                    height: 300,
                    width: 300,
                    length: 300,
                  );
                  roomCubit.addRoom(newRoom);
                  Navigator.of(dialogContext).pop();
                }
              },
              child: Text(
                'Add',
                style: TextStyle(color: colors.blackColor),
              ),
            )
          ],
        );
      },
    );
  }
}
