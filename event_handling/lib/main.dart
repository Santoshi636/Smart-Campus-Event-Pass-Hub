import 'package:flutter/material.dart';
import 'registration_screen.dart';

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
      ),

      home: const RegistrationScreen(
      eventName: "Tech Fest 2026",
    ),
    );
  }
}