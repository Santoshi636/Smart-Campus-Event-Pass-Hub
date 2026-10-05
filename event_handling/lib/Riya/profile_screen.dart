import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const Color primaryPurple = Color(0xFF6200EE);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8FA),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F8FA),
        elevation: 0,

        title: const Text(
          'My Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: false,

        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 30),

        child: Column(
          children: [
            // =========================
            // PROFILE CARD
            // =========================
            Container(
              width: double.infinity,

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF6200EE),
                    Color(0xFF8E2DE2),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),

                borderRadius: BorderRadius.circular(24),

                boxShadow: [
                  BoxShadow(
                    color: primaryPurple.withOpacity(0.25),
                    blurRadius: 15,
                    offset: const Offset(0, 7),
                  ),
                ],
              ),

              child: Column(
                children: [
                  Container(
                    height: 85,
                    width: 85,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,

                      border: Border.all(
                        color: Colors.white70,
                        width: 3,
                      ),
                    ),

                    child: const Icon(
                      Icons.person,
                      size: 50,
                      color: primaryPurple,
                    ),
                  ),

                  const SizedBox(height: 14),

                  const Text(
                    'Student Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    'student@campus.edu',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 7,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.18),
                      borderRadius: BorderRadius.circular(30),
                    ),

                    child: const Text(
                      'ACTIVE STUDENT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // =========================
            // PERSONAL INFORMATION
            // =========================
            _sectionTitle('Personal Information'),

            const SizedBox(height: 10),

            _infoCard(
              icon: Icons.person_outline,
              title: 'Full Name',
              value: 'Student Name',
            ),

            _infoCard(
              icon: Icons.email_outlined,
              title: 'Email',
              value: 'student@campus.edu',
            ),

            _infoCard(
              icon: Icons.phone_outlined,
              title: 'Phone',
              value: '+91 98765 43210',
            ),

            const SizedBox(height: 15),

            // =========================
            // COLLEGE INFORMATION
            // =========================
            _sectionTitle('College Information'),

            const SizedBox(height: 10),

            _infoCard(
              icon: Icons.badge_outlined,
              title: 'Student ID',
              value: 'SCH2027001',
            ),

            _infoCard(
              icon: Icons.school_outlined,
              title: 'Department',
              value: 'Computer Engineering',
            ),

            _infoCard(
              icon: Icons.calendar_month_outlined,
              title: 'Year',
              value: 'Third Year',
            ),

            const SizedBox(height: 20),

            // =========================
            // EDIT PROFILE
            // =========================
            SizedBox(
              width: double.infinity,
              height: 52,

              child: ElevatedButton.icon(
                onPressed: () {
                  _showEditMessage(context);
                },

                icon: const Icon(Icons.edit_outlined),

                label: const Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryPurple,
                  foregroundColor: Colors.white,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),

                  elevation: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,

      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _infoCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),

      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),

        boxShadow: const [
          BoxShadow(
            color: Color(0x08000000),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),

      child: Row(
        children: [
          Container(
            height: 42,
            width: 42,

            decoration: BoxDecoration(
              color: const Color(0xFFF1E8FF),
              borderRadius: BorderRadius.circular(12),
            ),

            child: Icon(
              icon,
              color: primaryPurple,
              size: 21,
            ),
          ),

          const SizedBox(width: 13),

          Expanded(
            child: Column(
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
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.chevron_right,
            color: Colors.grey,
            size: 20,
          ),
        ],
      ),
    );
  }

  void _showEditMessage(BuildContext context) {
    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

          title: const Text('Edit Profile'),

          content: const Text(
            'Profile editing can be connected to your registration data later.',
          ),

          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),

              child: const Text(
                'OK',
                style: TextStyle(
                  color: primaryPurple,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
