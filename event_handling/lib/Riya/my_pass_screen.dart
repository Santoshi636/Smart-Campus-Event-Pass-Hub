import 'package:flutter/material.dart';

class MyPassScreen extends StatelessWidget {
  const MyPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Pass"),
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.confirmation_number,
                  size: 60,
                ),

                const SizedBox(height: 15),

                const Text(
                  "Event Pass",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text("Student Name: Your Name"),
                const Text("Event: College Fest"),
                const Text("Date: 10 October 2026"),

                const SizedBox(height: 15),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text("View Pass"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}