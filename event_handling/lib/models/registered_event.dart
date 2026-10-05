class RegisteredEvent {
  final String eventName;
  final String eventType;
  final String eventDate;
  final String eventTime;
  final String venue;
  final String passId;
  final double fee;

  RegisteredEvent({
    required this.eventName,
    required this.eventType,
    required this.eventDate,
    required this.eventTime,
    required this.venue,
    required this.passId,
    required this.fee,
  });
}
