import 'package:auto_route/annotations.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:profile/profile/ui/profile_screen.dart';
import 'package:rooms/rooms/ui/rooms_screen.dart';
import 'package:settings/settings/ui/settings_screen.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final List<Widget> _pages = [
    const RoomsScreen(),
    const ProfileScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final AppColors colors = AppColors.of(context);
    return Scaffold(
      body: _pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: selectedIndex,
        selectedLabelStyle: AppFonts.boldWhiteText.copyWith(fontSize: 16),
        unselectedLabelStyle: AppFonts.boldWhiteText.copyWith(fontSize: 16),
        selectedItemColor: colors.tealColor,
        unselectedItemColor: colors.white,
        unselectedFontSize: 16,
        backgroundColor: colors.primaryColor,
        elevation: 0,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
