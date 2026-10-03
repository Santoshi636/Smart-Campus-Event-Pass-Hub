import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'registration_screen.dart';
import 'screen/splash_screen.dart';
import 'screens/events_screen.dart';
import 'theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const SmartCampusApp());
}

class SmartCampusApp extends StatelessWidget {
  const SmartCampusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Campus Event Hub',
      theme: AppTheme.lightTheme,

      // Member 1 Splash Screen as entry point
      home: const SplashScreen(),

      routes: {
        '/registration': (context) => const RegistrationScreen(
          eventName: "Tech Fest 2026",
          eventType: "Paid",
          eventFee: 300,
        ),
        '/events': (context) => const EventsScreen(),
      },
    );
  }
}
