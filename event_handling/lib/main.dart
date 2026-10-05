import 'package:flutter/material.dart';

// Member 1
import 'Mrunali/splash_screen.dart';
import 'Mrunali/home_screen.dart';

// Member 2
import 'Madhuri/events_screen.dart';
import 'Madhuri/clubs_screen.dart';
import 'Madhuri/event_details_screen.dart';

// Member 3
import 'Santoshi/registration_screen.dart';

// Member 4
import 'Riya/my_pass_screen.dart';
import 'Riya/profile_screen.dart';
import 'Riya/about_screen.dart';
import 'Riya/main_navigation.dart';

// Event Model
import 'models/event_model.dart';

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

        initialRoute: '/splash',

        routes: {
          '/splash': (context) => const SplashScreen(),

          // Member 1 Home + Member 4 Navigation
          '/home': (context) => const MainNavigation(
            home: HomeScreen(),
          ),

          '/events': (context) => const MadhuriEventsScreen(),

          '/clubs': (context) => const ClubsScreen(),

          // FIXED: Event Detail Navigation
          '/event-detail': (context) {
            final event =
            ModalRoute
                .of(context)!
                .settings
                .arguments as EventModel;

            return MadhuriEventDetailScreen(
              event: event,
            );
          },

          '/registration': (context) =>
          const RegistrationScreen(
            eventName: "Tech Fest 2026",
            eventType: "Paid",
            eventFee: 300,
          ),
        }
    );
  }
}
