import 'package:flutter/material.dart';
import 'digital_pass_screen.dart';

class PaymentScreen extends StatelessWidget {
  final String eventName;
  final String eventType;
  final double eventFee;

  final String name;
  final String email;
  final String studentId;
  final String department;
  final String collegeName;
  final String collegeYear;

  const PaymentScreen({
    super.key,
    required this.eventName,
    required this.eventType,
    required this.eventFee,
    required this.name,
    required this.email,
    required this.studentId,
    required this.department,
    required this.collegeName,
    required this.collegeYear,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Payment"),
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
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(blurRadius: 10, color: Colors.black12)
                ],
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.account_balance_wallet,
                    size: 80,
                    color: Colors.deepPurple,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    eventName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Amount Payable",
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "₹${eventFee.toStringAsFixed(0)}",
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),

            Card(
              child: ListTile(
                leading: const Icon(Icons.person, color: Colors.deepPurple),
                title: Text(name),
                subtitle: const Text("Participant Name"),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.email, color: Colors.deepPurple),
                title: Text(email),
                subtitle: const Text("Email Address"),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.badge, color: Colors.deepPurple),
                title: Text(studentId),
                subtitle: const Text("Student ID / PRN"),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.account_balance, color: Colors.deepPurple),
                title: Text(collegeName),
                subtitle: const Text("College Name"),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.school, color: Colors.deepPurple),
                title: Text("$department ($collegeYear)"),
                subtitle: const Text("Department & Academic Year"),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.payment),
                label: const Text(
                  "PAY NOW",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
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
                            "Payment Successful!",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => DigitalPassScreen(
                                    eventName: eventName,
                                    eventType: eventType,
                                    eventFee: eventFee,
                                    paymentStatus: "Paid",
                                    name: name,
                                    email: email,
                                    studentId: studentId,
                                    department: department,
                                    collegeName: collegeName,
                                    collegeYear: collegeYear,
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}