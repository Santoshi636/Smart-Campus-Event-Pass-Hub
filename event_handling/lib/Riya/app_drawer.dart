import 'package:flutter/material.dart';

import 'about_screen.dart';
import 'my_pass_screen.dart';
import 'profile_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  static const Color primaryPurple = Color(0xFF6200EE);
  static const Color lightPurple = Color(0xFFF1E8FF);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,

      child: SafeArea(
        child: Column(
          children: [
            // =========================
            // DRAWER HEADER
            // =========================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),

              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF6200EE),
                    Color(0xFF8E2DE2),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),

                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                ),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // App icon
                  Container(
                    height: 55,
                    width: 55,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),

                    child: const Icon(
                      Icons.school_rounded,
                      color: primaryPurple,
                      size: 30,
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    'Smart Campus Hub',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  const Text(
                    'Events & Pass',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            // =========================
            // USER
            // =========================
            Padding(
              padding: const EdgeInsets.all(16),

              child: Row(
                children: [
                  Container(
                    height: 48,
                    width: 48,

                    decoration: BoxDecoration(
                      color: lightPurple,
                      shape: BoxShape.circle,
                    ),

                    child: const Icon(
                      Icons.person,
                      color: primaryPurple,
                    ),
                  ),

                  const SizedBox(width: 12),

                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, Student',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),

                      SizedBox(height: 3),

                      Text(
                        'student@campus.edu',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Divider(height: 1),

            // =========================
            // MENU
            // =========================
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 12,
                ),

                children: [
                  _drawerItem(
                    context,
                    icon: Icons.home_outlined,
                    title: 'Home',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),

                  _drawerItem(
                    context,
                    icon: Icons.event_outlined,
                    title: 'Events',
                    onTap: () {
                      Navigator.pop(context);

                      Navigator.pushNamed(
                        context,
                        '/events',
                      );
                    },
                  ),

                  _drawerItem(
                    context,
                    icon: Icons.confirmation_number_outlined,
                    title: 'My Pass',
                    onTap: () {
                      Navigator.pop(context);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const MyPassScreen(),
                        ),
                      );
                    },
                  ),

                  _drawerItem(
                    context,
                    icon: Icons.person_outline,
                    title: 'Profile',
                    onTap: () {
                      Navigator.pop(context);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ProfileScreen(),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 8),

                  const Divider(),

                  const SizedBox(height: 8),

                  _drawerItem(
                    context,
                    icon: Icons.info_outline,
                    title: 'About & Help',
                    onTap: () {
                      Navigator.pop(context);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AboutScreen(),
                        ),
                      );
                    },
                  ),

                  _drawerItem(
                    context,
                    icon: Icons.settings_outlined,
                    title: 'Settings',
                    onTap: () {
                      Navigator.pop(context);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Settings will be available soon.',
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            // =========================
            // LOGOUT
            // =========================
            Padding(
              padding: const EdgeInsets.all(16),

              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),

                leading: const Icon(
                  Icons.logout,
                  color: Colors.redAccent,
                ),

                title: const Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                onTap: () {
                  Navigator.pop(context);

                  _showLogoutDialog(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(
      BuildContext context, {
        required IconData icon,
        required String title,
        required VoidCallback onTap,
      }) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),

      leading: Icon(
        icon,
        color: primaryPurple,
      ),

      title: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),

      trailing: const Icon(
        Icons.chevron_right,
        size: 18,
        color: Colors.grey,
      ),

      onTap: onTap,
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

          title: const Text('Logout'),

          content: const Text(
            'Are you sure you want to logout?',
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Logged out successfully'),
                  ),
                );
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: primaryPurple,
                foregroundColor: Colors.white,
              ),

              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}
