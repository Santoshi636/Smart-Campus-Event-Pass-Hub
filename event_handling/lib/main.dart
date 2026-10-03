import 'package:flutter/material.dart';
import 'Santoshi/registration_screen.dart';
import 'Mrunali/screen/splash_screen.dart';

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
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.white,
      ),

      // Your Member 1 Splash Screen
      home: const SplashScreen(),

      // Keep the other member's Registration Screen available
      routes: {
        '/registration': (context) => const RegistrationScreen(
          eventName: "Tech Fest 2026",
          eventType: "Paid",
          eventFee: 300,
        ),
      },
    );
  }
}
