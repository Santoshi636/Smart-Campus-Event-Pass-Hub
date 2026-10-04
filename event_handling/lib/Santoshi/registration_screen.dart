import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'digital_pass_screen.dart';
import 'payment_screen.dart';

class RegistrationScreen extends StatefulWidget {
  final String eventName;
  final String eventType;
  final double eventFee;

  const RegistrationScreen({
    super.key,
    required this.eventName,
    required this.eventType,
    required this.eventFee,
  });

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final studentIdController = TextEditingController();
  final collegeController = TextEditingController();

  String? _selectedDepartment;
  String? _selectedCollegeYear;

  final List<String> _departments = [
    'BSc IT',
    'BSc CS',
    'B.Tech AI & DS',
    'BCA',
    'MCA / MSc IT'
  ];

  final List<String> _collegeYears = [
    '1st Year (FY)',
    '2nd Year (SY)',
    '3rd Year (TY)',
    '4th Year / Postgrad'
  ];

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    studentIdController.dispose();
    collegeController.dispose();
    super.dispose();
  }

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      final departmentValue = _selectedDepartment ?? '';
      final yearValue = _selectedCollegeYear ?? '';

      if (widget.eventType == "Paid") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PaymentScreen(
              eventName: widget.eventName,
              eventType: widget.eventType,
              eventFee: widget.eventFee,
              name: nameController.text.trim(),
              email: emailController.text.trim(),
              studentId: studentIdController.text.trim(),
              department: _selectedDepartment ?? '',
              collegeName: collegeController.text.trim(),
              collegeYear: _selectedCollegeYear ?? '',
            ),
          ),
        );
      } else {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => AlertDialog(
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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DigitalPassScreen(
                          eventName: widget.eventName,
                          eventType: widget.eventType,
                          eventFee: widget.eventFee,
                          paymentStatus: "Not Required",
                          name: nameController.text.trim(),
                          email: emailController.text.trim(),
                          studentId: studentIdController.text.trim(),
                          department: _selectedDepartment ?? '',
                          collegeName: collegeController.text.trim(), // Added
                          collegeYear: _selectedCollegeYear ?? '',    // Added
                        ),
                      ),
                    );
                  },
                  child: const Text("View Pass"),
                ),
              ],
            ),
          ),
        );
      }
    }
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool isNumericOnly = false,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: isNumericOnly ? TextInputType.number : TextInputType.text,
      inputFormatters: isNumericOnly
          ? [FilteringTextInputFormatter.digitsOnly]
          : null,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Please enter $label";
        }

        if (label == "Full Name" && value.trim().length < 3) {
          return "Name must be at least 3 characters long";
        }

        if (label == "College Name" && value.trim().length < 3) {
          return "Please enter valid college name";
        }

        if (label == "Email") {
          final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
          if (!emailRegExp.hasMatch(value.trim())) {
            return "Enter a valid email address";
          }
        }

        // Numeric validation for Student ID
        if (label == "Student ID / PRN") {
          final numericRegExp = RegExp(r'^[0-9]+$');
          if (!numericRegExp.hasMatch(value.trim())) {
            return "Student ID must contain numbers only";
          }
          if (value.trim().length < 4) {
            return "Enter a valid numeric ID (at least 4 digits)";
          }
        }

        return null;
      },
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: label,
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
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
            gradient: LinearGradient(
              colors: [Color(0xff4A00E0), Color(0xff8E2DE2)],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 230,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [Color(0xff4A00E0), Color(0xff8E2DE2)],
                ),
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
                  Text(
                    widget.eventName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: widget.eventType == "Paid"
                          ? Colors.orange
                          : Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      widget.eventType == "Paid"
                          ? "Paid Event • ₹${widget.eventFee.toStringAsFixed(0)}"
                          : "Free Event",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Register & Get Your Digital Pass",
                    style: TextStyle(color: Colors.white70),
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
                padding: const EdgeInsets.all(25),
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

                      // Student ID (Numbers Only)
                      buildTextField(
                        controller: studentIdController,
                        label: "Student ID / PRN",
                        icon: Icons.badge,
                        isNumericOnly: true,
                      ),
                      const SizedBox(height: 20),

                      // College Name Field
                      buildTextField(
                        controller: collegeController,
                        label: "College Name",
                        icon: Icons.account_balance,
                      ),
                      const SizedBox(height: 20),

                      // Department Selection Dropdown
                      DropdownButtonFormField<String>(
                        value: _selectedDepartment,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.school),
                          labelText: "Department",
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        items: _departments.map((dept) {
                          return DropdownMenuItem(
                            value: dept,
                            child: Text(dept),
                          );
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            _selectedDepartment = val;
                          });
                        },
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return "Please select your department";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // College Year Dropdown
                      DropdownButtonFormField<String>(
                        value: _selectedCollegeYear,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.calendar_today),
                          labelText: "College Year",
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        items: _collegeYears.map((year) {
                          return DropdownMenuItem(
                            value: year,
                            child: Text(year),
                          );
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            _selectedCollegeYear = val;
                          });
                        },
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return "Please select your academic year";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),

                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: submitForm,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text(
                            "REGISTER NOW",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
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