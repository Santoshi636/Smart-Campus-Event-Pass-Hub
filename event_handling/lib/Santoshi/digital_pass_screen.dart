import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DigitalPassScreen extends StatelessWidget {
  final String eventName;
  final String eventType;
  final double eventFee;
  final String paymentStatus;

  final String name;
  final String email;
  final String studentId;
  final String department;
  final String collegeName;
  final String collegeYear;

  const DigitalPassScreen({
    super.key,
    required this.eventName,
    required this.eventType,
    required this.eventFee,
    required this.paymentStatus,
    required this.name,
    required this.email,
    required this.studentId,
    required this.department,
    required this.collegeName,
    required this.collegeYear,
  });

  // ============================================================
  // QR DATA
  // ============================================================

  String get qrData {
    return '''
SMART CAMPUS EVENT PASS

Event: $eventName
Event Type: $eventType
Fee: ₹${eventFee.toStringAsFixed(0)}

Payment Status: $paymentStatus

Name: $name
Student ID: $studentId
Email: $email
Department: $department
College: $collegeName
Year: $collegeYear
''';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,

      appBar: AppBar(
        title: const Text(
          "Digital Event Pass",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        foregroundColor: Colors.white,

        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff4A00E0),
                Color(0xff8E2DE2),
              ],
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 25,
        ),

        child: Column(
          children: [

            // ==================================================
            // DIGITAL PASS
            // ==================================================

            PhysicalModel(
              color: Colors.transparent,
              elevation: 10,
              shadowColor: Colors.black45,
              borderRadius: BorderRadius.circular(25),

              child: ClipPath(
                clipper: TicketClipper(),

                child: Container(
                  color: Colors.white,

                  child: Column(
                    children: [

                      // ========================================
                      // HEADER
                      // ========================================

                      Container(
                        width: double.infinity,

                        padding: const EdgeInsets.symmetric(
                          vertical: 24,
                          horizontal: 20,
                        ),

                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff4A00E0),
                              Color(0xff8E2DE2),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),

                        child: Column(
                          children: [

                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 5,
                              ),

                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.20),
                                borderRadius:
                                BorderRadius.circular(20),
                              ),

                              child: const Text(
                                "SMART CAMPUS EVENT PASS",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ),

                            const SizedBox(height: 12),

                            Text(
                              eventName,
                              textAlign: TextAlign.center,

                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 10),

                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 6,
                              ),

                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.15),
                                borderRadius:
                                BorderRadius.circular(20),
                              ),

                              child: Text(
                                "Status: $paymentStatus",

                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // ========================================
                      // DETAILS
                      // ========================================

                      Padding(
                        padding: const EdgeInsets.all(20),

                        child: Column(
                          children: [

                            buildDetailRow(
                              icon: Icons.person_rounded,
                              label: "Attendee Name",
                              value: name,
                            ),

                            const Divider(height: 22),

                            buildDetailRow(
                              icon: Icons.email_rounded,
                              label: "Email",
                              value: email,
                            ),

                            const Divider(height: 22),

                            buildDetailRow(
                              icon: Icons.badge_rounded,
                              label: "Student ID / PRN",
                              value: studentId,
                            ),

                            const Divider(height: 22),

                            buildDetailRow(
                              icon: Icons.account_balance_rounded,
                              label: "College Name",
                              value: collegeName,
                            ),

                            const Divider(height: 22),

                            buildDetailRow(
                              icon: Icons.school_rounded,
                              label: "Department",
                              value: department,
                            ),

                            const Divider(height: 22),

                            buildDetailRow(
                              icon: Icons.calendar_today_rounded,
                              label: "College Year",
                              value: collegeYear,
                            ),

                            const Divider(height: 22),

                            buildDetailRow(
                              icon: Icons.confirmation_number_rounded,
                              label: "Event Type",
                              value: eventType == "Paid"
                                  ? "Paid (₹${eventFee.toStringAsFixed(0)})"
                                  : "Free Access",
                            ),
                          ],
                        ),
                      ),

                      // ========================================
                      // DASHED LINE
                      // ========================================

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                        ),

                        child: Row(
                          children: List.generate(
                            28,

                                (index) => Expanded(
                              child: Container(
                                height: 2,

                                color: index % 2 == 0
                                    ? Colors.grey.shade300
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                      ),

                      // ========================================
                      // QR CODE
                      // ========================================

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 25,
                          horizontal: 20,
                        ),

                        child: Column(
                          children: [

                            const Text(
                              "ENTRY QR CODE",

                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                                letterSpacing: 1,
                              ),
                            ),

                            const SizedBox(height: 6),

                            const Text(
                              "Show this QR code at the entry gate",

                              textAlign: TextAlign.center,

                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),

                            const SizedBox(height: 18),

                            // QR CONTAINER
                            Container(
                              width: 230,
                              height: 230,

                              padding: const EdgeInsets.all(15),

                              decoration: BoxDecoration(
                                color: Colors.white,

                                borderRadius:
                                BorderRadius.circular(20),

                                border: Border.all(
                                  color: Colors.deepPurple.shade100,
                                  width: 2,
                                ),

                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 12,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),

                              child: Center(
                                child: QrImageView(
                                  data: qrData,

                                  version: QrVersions.auto,

                                  size: 190,

                                  backgroundColor:
                                  Colors.white,

                                  errorCorrectionLevel:
                                  QrErrorCorrectLevel.H,

                                  gapless: true,

                                  eyeStyle:
                                  const QrEyeStyle(
                                    eyeShape:
                                    QrEyeShape.square,
                                    color: Colors.black,
                                  ),

                                  dataModuleStyle:
                                  const QrDataModuleStyle(
                                    dataModuleShape:
                                    QrDataModuleShape.square,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 15),

                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,

                              children: const [
                                Icon(
                                  Icons.qr_code_scanner,
                                  size: 18,
                                  color: Colors.deepPurple,
                                ),

                                SizedBox(width: 7),

                                Text(
                                  "Scan at Entry Gate",

                                  style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // ========================================
                      // VERIFIED FOOTER
                      // ========================================

                      Container(
                        width: double.infinity,

                        padding: const EdgeInsets.all(14),

                        color: Colors.deepPurple.shade50,

                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.center,

                          children: const [

                            Icon(
                              Icons.verified,
                              color: Colors.deepPurple,
                              size: 18,
                            ),

                            SizedBox(width: 6),

                            Flexible(
                              child: Text(
                                "Official Smart Campus Verified Pass",

                                textAlign: TextAlign.center,

                                style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // ==================================================
            // BACK HOME
            // ==================================================

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.popUntil(
                    context,
                        (route) => route.isFirst,
                  );
                },

                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),

                label: const Text(
                  "BACK TO HOME",

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,

                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(15),
                  ),

                  elevation: 4,
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // DETAIL ROW
  // ============================================================

  Widget buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Icon(
          icon,
          color: Colors.deepPurple,
          size: 22,
        ),

        const SizedBox(width: 14),

        Expanded(
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              Text(
                label,

                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 3),

              Text(
                value.isEmpty ? "N/A" : value,

                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ============================================================
// TICKET CLIPPER
// ============================================================

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();

    const double radius = 25.0;
    const double notchRadius = 14.0;

    // Keep notch around the middle.
    final double notchY = size.height * 0.61;

    path.moveTo(radius, 0);

    path.lineTo(size.width - radius, 0);

    path.arcToPoint(
      Offset(size.width, radius),
      radius: const Radius.circular(radius),
    );

    // Right notch
    path.lineTo(
      size.width,
      notchY - notchRadius,
    );

    path.arcToPoint(
      Offset(
        size.width,
        notchY + notchRadius,
      ),
      radius: const Radius.circular(notchRadius),
      clockwise: false,
    );

    path.lineTo(
      size.width,
      size.height - radius,
    );

    path.arcToPoint(
      Offset(
        size.width - radius,
        size.height,
      ),
      radius: const Radius.circular(radius),
    );

    path.lineTo(radius, size.height);

    path.arcToPoint(
      Offset(0, size.height - radius),
      radius: const Radius.circular(radius),
    );

    // Left notch
    path.lineTo(
      0,
      notchY + notchRadius,
    );

    path.arcToPoint(
      Offset(
        0,
        notchY - notchRadius,
      ),
      radius: const Radius.circular(notchRadius),
      clockwise: false,
    );

    path.lineTo(0, radius);

    path.arcToPoint(
      Offset(radius, 0),
      radius: const Radius.circular(radius),
    );

    path.close();

    return path;
  }

  @override
  bool shouldReclip(
      CustomClipper<Path> oldClipper,
      ) {
    return false;
  }
}
