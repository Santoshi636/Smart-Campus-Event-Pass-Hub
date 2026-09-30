import 'package:flutter/material.dart';
import 'digital_pass_screen.dart';

class RegistrationScreen extends StatefulWidget {
  final String eventName;

  const RegistrationScreen({
    Key? key,
    required this.eventName,
  }) : super(key: key);

  @override
  State<RegistrationScreen> createState() =>
      _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final studentIdController = TextEditingController();
  final departmentController = TextEditingController();

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 80,
              ),
              const SizedBox(height: 15),
              const Text(
                "Registration Successful!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "You have registered for\n${widget.eventName}",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);

                  Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (_) => DigitalPassScreen(
                  eventName: widget.eventName,
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
              )
            ],
          ),
        ),
      );
    }
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter $label";
        }

        if (label == "Email" &&
        !value.contains("@")) {
        return "Enter valid email";
        }

        return null;
      },
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: label,
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(15),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,

        appBar: AppBar(
        title: const Text("Event Registration"),
          centerTitle: true,
          foregroundColor: Colors.white,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [ Color(0xff4A00E0), Color(0xff8E2DE2),],),
            ),
          ),
        ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(colors: [Color(0xff4A00E0), Color(0xff8E2DE2),],),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.event_available,
                    color: Colors.white,
                    size: 70,
                  ),
                  const SizedBox(height: 10),
                  Text(widget.eventName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,),
                  ),
                  const SizedBox(height: 5),
                  const Text("Register & Get Your Digital Pass",
                    style: TextStyle(color: Colors.white70,),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      buildTextField(
                        controller: nameController,
                        label: "Full Name",
                        icon: Icons.person,
                      ),
                      const SizedBox(height: 20),
                      buildTextField(
                        controller: emailController,
                        label: "Email",
                        icon: Icons.email,
                      ),
                      const SizedBox(height: 20),
                      buildTextField(
                        controller: studentIdController,
                        label: "Student ID",
                        icon: Icons.badge,
                      ),
                      const SizedBox(height: 20),
                      buildTextField(
                        controller: departmentController,
                        label: "Department",
                        icon: Icons.school,
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(onPressed: submitForm,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
                          ),
                          child: const Text("REGISTER NOW",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}