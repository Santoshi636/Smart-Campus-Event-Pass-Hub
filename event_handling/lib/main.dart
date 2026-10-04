import 'package:flutter/material.dart';
import 'Mrunali/screen/splash_screen.dart';

// Member 1 Import (e.g., Home / Event List)
// import 'Member1/event_list_screen.dart';

// Member 2 Import (e.g., Event Details)
// import 'Member2/event_details_screen.dart';

// Member 3 Import (Your Registration & Pass Module)
import 'Santoshi/registration_screen.dart';

// Member 4 Import (e.g., User Profile / Passes List)
// import 'Member4/profile_screen.dart';

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
      initialRoute: '/home',

      // Centralized Named Routes Table
      routes: {
        // Member 1 Route (SplashScreen added)
        '/home': (context) => const SplashScreen(),

        // Member 2 Route
        // '/event-details': (context) => const EventDetailsScreen(),

        // Member 3 Route (Your Module)
        '/registration': (context) => const RegistrationScreen(
          eventName: "Tech Fest 2026",
          eventType: "Paid",
          eventFee: 300,
        ),

        // Member 4 Route
        // '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}