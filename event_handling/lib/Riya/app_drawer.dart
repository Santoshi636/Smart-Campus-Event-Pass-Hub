import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.school,
                  size: 50,
                ),
                SizedBox(height: 10),
                Text(
                  "Smart Campus",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),

          ListTile(
            leading: const Icon(Icons.event),
            title: const Text("Events"),
            onTap: () {
              Navigator.pushNamed(context, '/events');
            },
          ),

          ListTile(
            leading: const Icon(Icons.confirmation_number),
            title: const Text("My Pass"),
            onTap: () {
              Navigator.pushNamed(context, '/myPass');
            },
          ),

          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Profile"),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),

          ListTile(
            leading: const Icon(Icons.help),
            title: const Text("About / Help"),
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
        ],
      ),
    );
  }
}