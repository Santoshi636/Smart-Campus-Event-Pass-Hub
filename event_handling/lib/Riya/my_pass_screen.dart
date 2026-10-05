import 'package:flutter/material.dart';

import '../models/pass_manager.dart';
import '../models/registered_event.dart';
import '/Santoshi/digital_pass_screen.dart';

class MyPassScreen extends StatefulWidget {
  const MyPassScreen({super.key});

  @override
  State<MyPassScreen> createState() =>
      _MyPassScreenState();
}

class _MyPassScreenState
    extends State<MyPassScreen> {

  static const Color primaryPurple =
  Color(0xFF6200EE);

  @override
  void initState() {
    super.initState();

    _refresh();
  }

  // ============================================================
  // REFRESH SCREEN
  // ============================================================

  void _refresh() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  // ============================================================
  // OPEN DIGITAL PASS
  // ============================================================

  void _openDigitalPass(
      RegisteredEvent pass) {

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DigitalPassScreen(
          eventName: pass.eventName,

          eventType: pass.eventType,

          eventFee: pass.fee,

          paymentStatus:
          pass.fee == 0
              ? "Not Required"
              : "Paid",

          // Student details
          name: pass.name,

          email: pass.email,

          studentId: pass.studentId,

          department: pass.department,

          collegeName: pass.collegeName,

          collegeYear: pass.collegeYear,
        ),
      ),
    );
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {

    final List<RegisteredEvent> passes =
    List<RegisteredEvent>.from(
      PassManager.myPasses,
    );

    return Scaffold(
      backgroundColor:
      const Color(0xFFF8F8FA),

      appBar: AppBar(
        backgroundColor:
        const Color(0xFFF8F8FA),

        elevation: 0,

        title: const Text(
          'My Pass',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),

        iconTheme:
        const IconThemeData(
          color: Colors.black,
        ),
      ),

      body: passes.isEmpty
          ? _emptyPassScreen()
          : RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },

        child: ListView(
          physics:
          const AlwaysScrollableScrollPhysics(),

          padding:
          const EdgeInsets.all(16),

          children: [

            const Text(
              'My Registered Events',
              style: TextStyle(
                fontSize: 21,
                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'Events you have successfully registered for.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 20),

            ...passes.map(
                  (pass) =>
                  _passCard(pass),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // EMPTY PASS SCREEN
  // ============================================================

  Widget _emptyPassScreen() {

    return Center(
      child: Padding(
        padding:
        const EdgeInsets.all(30),

        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,

          children: [

            Container(
              height: 100,
              width: 100,

              decoration:
              const BoxDecoration(
                color:
                Color(0xFFF1E8FF),
                shape: BoxShape.circle,
              ),

              child: const Icon(
                Icons.confirmation_number_outlined,
                size: 50,
                color: primaryPurple,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'No Passes Yet',
              style: TextStyle(
                fontSize: 22,
                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'You have not registered for any events yet.\n'
                  'Register for an event and your pass will appear here.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              height: 48,

              child:
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/events',
                  );
                },

                icon: const Icon(
                  Icons.event_outlined,
                ),

                label: const Text(
                  'Explore Events',
                  style: TextStyle(
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                style:
                ElevatedButton.styleFrom(
                  backgroundColor:
                  primaryPurple,

                  foregroundColor:
                  Colors.white,

                  shape:
                  RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(
                      15,
                    ),
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

  // ============================================================
  // PASS CARD
  // ============================================================

  Widget _passCard(
      RegisteredEvent pass) {

    return GestureDetector(

      // IMPORTANT:
      // Clicking the pass now opens the complete
      // DigitalPassScreen with student details + QR.
      onTap: () {
        _openDigitalPass(pass);
      },

      child: Container(
        margin:
        const EdgeInsets.only(
          bottom: 18,
        ),

        decoration:
        BoxDecoration(
          color: Colors.white,

          borderRadius:
          BorderRadius.circular(22),

          boxShadow: const [
            BoxShadow(
              color: Color(0x12000000),
              blurRadius: 12,
              offset: Offset(0, 5),
            ),
          ],
        ),

        child: Column(
          children: [

            // ==================================================
            // PASS HEADER
            // ==================================================

            Container(
              width: double.infinity,

              padding:
              const EdgeInsets.all(18),

              decoration:
              const BoxDecoration(
                gradient:
                LinearGradient(
                  colors: [
                    Color(0xFF6200EE),
                    Color(0xFF8E2DE2),
                  ],
                ),

                borderRadius:
                BorderRadius.only(
                  topLeft:
                  Radius.circular(22),
                  topRight:
                  Radius.circular(22),
                ),
              ),

              child: Row(
                children: [

                  Container(
                    height: 45,
                    width: 45,

                    decoration:
                    BoxDecoration(
                      color: Colors.white,

                      borderRadius:
                      BorderRadius.circular(
                        13,
                      ),
                    ),

                    child: const Icon(
                      Icons.event,

                      color:
                      primaryPurple,
                    ),
                  ),

                  const SizedBox(
                    width: 12,
                  ),

                  Expanded(
                    child: Text(
                      pass.eventName,

                      maxLines: 2,

                      overflow:
                      TextOverflow.ellipsis,

                      style:
                      const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(width: 8),

                  Container(
                    padding:
                    const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 5,
                    ),

                    decoration:
                    BoxDecoration(
                      color: Colors.white
                          .withOpacity(0.2),

                      borderRadius:
                      BorderRadius.circular(
                        20,
                      ),
                    ),

                    child: Text(
                      pass.fee == 0
                          ? 'FREE'
                          : 'PAID',

                      style:
                      const TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ==================================================
            // PASS DETAILS
            // ==================================================

            Padding(
              padding:
              const EdgeInsets.all(18),

              child: Column(
                children: [

                  _detailRow(
                    Icons.calendar_today_outlined,
                    'Date',
                    pass.eventDate,
                  ),

                  _detailRow(
                    Icons.access_time_outlined,
                    'Time',
                    pass.eventTime,
                  ),

                  _detailRow(
                    Icons.location_on_outlined,
                    'Venue',
                    pass.venue,
                  ),

                  _detailRow(
                    Icons.badge_outlined,
                    'Pass ID',
                    pass.passId,
                  ),

                  const SizedBox(
                    height: 8,
                  ),

                  const Divider(),

                  const SizedBox(
                    height: 10,
                  ),

                  // ==================================================
                  // BOTTOM ACTION
                  // ==================================================

                  Row(
                    children: [

                      const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 20,
                      ),

                      const SizedBox(
                        width: 8,
                      ),

                      Expanded(
                        child: Text(
                          pass.fee == 0
                              ? 'Free registration confirmed'
                              : 'Payment successful',

                          style:
                          const TextStyle(
                            color: Colors.green,
                            fontWeight:
                            FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),

                      const Icon(
                        Icons.qr_code_2,
                        color:
                        primaryPurple,
                        size: 22,
                      ),

                      const SizedBox(
                        width: 5,
                      ),

                      const Icon(
                        Icons.chevron_right,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // DETAIL ROW
  // ============================================================

  Widget _detailRow(
      IconData icon,
      String title,
      String value,
      ) {

    return Padding(
      padding:
      const EdgeInsets.only(
        bottom: 13,
      ),

      child: Row(
        children: [

          Icon(
            icon,
            size: 19,
            color: primaryPurple,
          ),

          const SizedBox(width: 10),

          Text(
            '$title: ',

            style:
            const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),

          Expanded(
            child: Text(
              value,

              maxLines: 2,

              overflow:
              TextOverflow.ellipsis,

              style:
              const TextStyle(
                fontSize: 12,
                fontWeight:
                FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}