import 'package:flutter/material.dart';

import 'app_drawer.dart';
import 'my_pass_screen.dart';
import 'profile_screen.dart';

class MainNavigation extends StatefulWidget {
  final Widget home;

  const MainNavigation({
    super.key,
    required this.home,
  });

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8FA),

      drawer: const AppDrawer(),

      body: SafeArea(
        child: _buildCurrentScreen(),
      ),

      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x15000000),
              blurRadius: 15,
              offset: Offset(0, -3),
            ),
          ],
        ),

        child: BottomNavigationBar(
          currentIndex: _selectedIndex,

          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },

          backgroundColor: Colors.white,

          elevation: 0,

          type: BottomNavigationBarType.fixed,

          selectedItemColor: const Color(0xFF6200EE),

          unselectedItemColor: const Color(0xFF888888),

          selectedFontSize: 12,

          unselectedFontSize: 11,

          showUnselectedLabels: true,

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),

            BottomNavigationBarItem(
              icon: Icon(
                Icons.confirmation_number_outlined,
              ),
              activeIcon: Icon(
                Icons.confirmation_number,
              ),
              label: 'My Pass',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentScreen() {
    switch (_selectedIndex) {
      case 0:
        return widget.home;

      case 1:
      // Create a fresh MyPassScreen every time
      // the My Pass tab is selected.
        return const MyPassScreen(
          key: ValueKey('my_pass_screen'),
        );

      case 2:
        return const ProfileScreen();

      default:
        return widget.home;
    }
  }
}
