import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static const Color primaryPurple = Color(0xFF6200EE);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8FA),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F8FA),
        elevation: 0,

        title: const Text(
          'About & Help',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),

        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            // =========================
            // APP LOGO
            // =========================
            Container(
              height: 90,
              width: 90,

              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF6200EE),
                    Color(0xFF8E2DE2),
                  ],
                ),

                borderRadius: BorderRadius.circular(25),

                boxShadow: [
                  BoxShadow(
                    color: primaryPurple.withOpacity(0.25),
                    blurRadius: 15,
                    offset: const Offset(0, 7),
                  ),
                ],
              ),

              child: const Icon(
                Icons.school_rounded,
                color: Colors.white,
                size: 50,
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              'Smart Campus Hub',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'Events & Pass',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 25),

            // =========================
            // ABOUT
            // =========================
            _card(
              icon: Icons.info_outline,
              title: 'About the App',
              child: const Text(
                'Smart Campus Hub helps students discover campus events, '
                    'explore categories, register for events and access their '
                    'digital event passes in one convenient application.',
                style: TextStyle(
                  color: Colors.grey,
                  height: 1.5,
                  fontSize: 13,
                ),
              ),
            ),

            const SizedBox(height: 15),

            // =========================
            // HELP
            // =========================
            _card(
              icon: Icons.help_outline,
              title: 'Frequently Asked Questions',
              child: Column(
                children: [
                  _faq(
                    'How can I register for an event?',
                    'Open an event from the Events section and tap Register Now.',
                  ),

                  _faq(
                    'Where can I find my event pass?',
                    'Open My Pass from the bottom navigation or drawer.',
                  ),

                  _faq(
                    'Can I edit my profile?',
                    'Open Profile and select Edit Profile.',
                  ),

                  _faq(
                    'How do I find campus events?',
                    'Use the Home or Events section to explore upcoming events.',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // =========================
            // CONTACT
            // =========================
            _card(
              icon: Icons.support_agent_outlined,
              title: 'Need Help?',
              child: Column(
                children: [
                  _contactRow(
                    Icons.email_outlined,
                    'Email',
                    'support@smartcampus.com',
                  ),

                  const SizedBox(height: 12),

                  _contactRow(
                    Icons.phone_outlined,
                    'Phone',
                    '+91 98765 43210',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Version 1.0.0',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 11,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'Made for Smart Campus Hub',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _card({
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),

        boxShadow: const [
          BoxShadow(
            color: Color(0x08000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,

                decoration: BoxDecoration(
                  color: const Color(0xFFF1E8FF),
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Icon(
                  icon,
                  color: primaryPurple,
                ),
              ),

              const SizedBox(width: 12),

              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          child,
        ],
      ),
    );
  }

  Widget _faq(String question, String answer) {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,

      childrenPadding: const EdgeInsets.only(
        bottom: 10,
      ),

      title: Text(
        question,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),

      iconColor: primaryPurple,

      collapsedIconColor: Colors.grey,

      children: [
        Align(
          alignment: Alignment.centerLeft,

          child: Text(
            answer,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }

  Widget _contactRow(
      IconData icon,
      String title,
      String value,
      ) {
    return Row(
      children: [
        Icon(
          icon,
          color: primaryPurple,
          size: 21,
        ),

        const SizedBox(width: 12),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 11,
              ),
            ),

            const SizedBox(height: 3),

            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
