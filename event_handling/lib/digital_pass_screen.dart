import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DigitalPassScreen extends StatelessWidget {
  final String name;
  final String email;
  final String studentId;
  final String department;

  const DigitalPassScreen({
    super.key,
    required this.name,
    required this.email,
    required this.studentId,
    required this.department,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Digital Pass"),
      ),
      body: Center(
        child: Card(
          elevation: 10,
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                const Icon(
                  Icons.verified,
                  color: Colors.green,
                  size: 70,
                ),

                const SizedBox(height: 10),

                const Text(
                  "SMART CAMPUS EVENT",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Text(
                  "DIGITAL ENTRY PASS",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),

                const Divider(),

                ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(name),
                ),

                ListTile(
                  leading: const Icon(Icons.badge),
                  title: Text(studentId),
                ),

                ListTile(
                  leading: const Icon(Icons.email),
                  title: Text(email),
                ),

                ListTile(
                  leading: const Icon(Icons.school),
                  title: Text(department),
                ),

                const SizedBox(height: 15),

                QrImageView(
                  data: "$studentId-$name",
                  size: 180,
                ),

                const SizedBox(height: 10),

                Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.green.shade100,
                  child: const Text(
                    "ENTRY APPROVED",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}