import 'package:flutter/material.dart';
// Member 1 Import (Home / Event List)
import 'Mrunali/splash_screen.dart';
import 'Mrunali/home_screen.dart';

// Member 2 Import (Events Catalogue, Event Detail, Clubs)
import 'Madhuri/events_screen.dart';
import 'Madhuri/clubs_screen.dart';

// Member 3 Import (Registration & Pass Module)
import 'Santoshi/registration_screen.dart';

// Member 4 Import
import 'Riya/my_pass.dart';
import 'Riya/profile.dart';
import 'Riya/about_help.dart';

void main() {
  runApp(const SmartCampusApp());
}

class SmartCampusApp extends StatelessWidget {
  const SmartCampusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Campus Event Hub',

      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFF7F7FB),
        useMaterial3: true,
      ),

      // Set the initial route matching your routes table string
      initialRoute: '/splash',

      // Centralized Named Routes Table
      routes: {
        // Member 1 Route (SplashScreen added)
        '/splash': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),

        // Member 2 Routes (Events Catalogue + Clubs)
        '/events': (context) => const MadhuriEventsScreen(),
        '/clubs': (context) => const ClubsScreen(),

        // Member 3 Route (Registration Module)
        '/registration': (context) => const RegistrationScreen(
          eventName: "Tech Fest 2026",
          eventType: "Paid",
          eventFee: 300,
        ),

        '/myPass': (context) => const MyPass(),
        '/profile': (context) => const Profile(),
        '/about': (context) => const AboutHelp(),


      },
    );
  }
}