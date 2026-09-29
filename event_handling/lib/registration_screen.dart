import 'package:flutter/material.dart';
import 'digital_pass_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() =>
      _RegistrationScreenState();
}

class _RegistrationScreenState
    extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final studentIdController = TextEditingController();
  final departmentController = TextEditingController();

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Registration Successful"),
          content: const Text(
            "Your event registration has been completed!",
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);

                Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => DigitalPassScreen(
                name: nameController.text,
                email: emailController.text,
                studentId:
                studentIdController.text,
                department:
                departmentController.text,
                ),
                ),
                );
              },
              child: const Text("View Pass"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Event Registration"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
            key: _formKey,
            child: ListView(
                children: [

                const SizedBox(height: 20),

            TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
        labelText: "Full Name",
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null ||
            value.trim().isEmpty) {
          return "Enter your name";
        }
        return null;
      },
    ),

    const SizedBox(height: 15),

    TextFormField(
    controller: emailController,
    decoration: const InputDecoration(
    labelText: "Email",
    border: OutlineInputBorder(),
    ),
    validator: (value) {
    if (value == null ||
    !value.contains("@")) {
    return "Enter valid email";
    }
    return null;
    },
    ),

    const SizedBox(height: 15),

    TextFormField(
    controller: studentIdController,
    decoration: const InputDecoration(
    labelText: "Student ID",
    border: OutlineInputBorder(),
    ),
    validator: (value) {
    if (value == null ||
    value.isEmpty) {
    return "Enter Student ID";
    }
    return null;
    },
    ),

    const SizedBox(height: 15),

    TextFormField(
    controller: departmentController,
    decoration: const InputDecoration(
    labelText: "Department",
    border: OutlineInputBorder(),
    ),
    validator: (value) {
    if (value == null ||
    value.isEmpty) {
    return "Enter Department";
    }
    return null;
    },
    ),

    const SizedBox(height: 25),

    ElevatedButton(
    onPressed: submitForm,
    child: const Text(
    "Register Now",
    ),
    ),
    ],
    ),
    ),
    ),
    );
  }
}