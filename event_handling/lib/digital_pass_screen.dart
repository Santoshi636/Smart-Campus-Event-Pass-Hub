import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DigitalPassScreen extends StatelessWidget {
  final String eventName;
  final String name;
  final String email;
  final String studentId;
  final String department;
  final String eventType;
  final double eventFee;
  final String paymentStatus;

  const DigitalPassScreen({
    super.key,
    required this.eventName,
    required this.name,
    required this.email,
    required this.studentId,
    required this.department,
    required this.eventType,
    required this.eventFee,
    required this.paymentStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
        Colors.grey.shade200,

        appBar: AppBar(
        title:
        const Text("Digital Pass"),
        centerTitle: true,
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xff4A00E0), Color(0xff8E2DE2),],),
          ),
        ),
        ),

      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: const LinearGradient(colors: [Color(0xff4A00E0), Color(0xff8E2DE2),],),
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundColor:
                Colors.white,
                child: Icon(Icons.person, size: 40, color: Colors.deepPurple,),
              ),
              const SizedBox(height: 15),
              Text(eventName, textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(
                color: Colors.white,
              ),

              ListTile(
                leading: const Icon(Icons.person, color: Colors.white,),
                title: Text(name,
                  style: const TextStyle(color: Colors.white,),
                ),),

              ListTile(
                leading: const Icon(Icons.badge, color: Colors.white,),
                title: Text(studentId,
                  style: const TextStyle(color: Colors.white,),
                ),),

              ListTile(
                leading: const Icon(Icons.school, color: Colors.white,),
                title: Text(department,
                  style: const TextStyle(color: Colors.white,),
                ),),

              const SizedBox(height: 20),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(8),
                child: QrImageView(
                  data: '''
                    Event: $eventName
                    Name: $name
                    Student ID: $studentId
                    Department: $department
                    ''',
                  size: 180,
                ),
              ),

              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10,),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Text("ENTRY APPROVED",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}