class RegisteredEvent {
  // ============================================================
  // EVENT DETAILS
  // ============================================================

  final String eventName;
  final String eventType;
  final String eventDate;
  final String eventTime;
  final String venue;
  final String passId;
  final double fee;

  // ============================================================
  // STUDENT DETAILS
  // ============================================================

  final String name;
  final String email;
  final String studentId;
  final String department;
  final String collegeName;
  final String collegeYear;

  RegisteredEvent({
    required this.eventName,
    required this.eventType,
    required this.eventDate,
    required this.eventTime,
    required this.venue,
    required this.passId,
    required this.fee,

    required this.name,
    required this.email,
    required this.studentId,
    required this.department,
    required this.collegeName,
    required this.collegeYear,
  });
}