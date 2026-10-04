class EventModel {
  final String id;
  final String title;
  final String category;
  final String date;
  final String time;
  final String location;
  final String venue;
  final double price;
  final String eventType; // "Paid" or "Free"
  final double eventFee;  // Numeric fee amount
  final String attendeeCount;
  final String description;
  final String imageUrl;
  final bool isPopular;

  const EventModel({
    required this.id,
    required this.title,
    required this.category,
    required this.date,
    required this.time,
    required this.location,
    required this.venue,
    required this.price,
    required this.eventType,
    required this.eventFee,
    required this.attendeeCount,
    required this.description,
    required this.imageUrl,
    this.isPopular = false,
  });

  static List<EventModel> get sampleEvents => [
    const EventModel(
      id: '1',
      title: 'Campus Music Fest 2026',
      category: 'Music Festival',
      date: '10-13 December 2026',
      time: '17:00 - 22:00',
      location: 'Churchgate, Mumbai',
      venue: 'Patkar Hall, SNDT Campus, Mumbai',
      price: 250.0,
      eventType: 'Paid',
      eventFee: 250.0,
      attendeeCount: '8.4K',
      description:
      'Annual premier campus music festival featuring live bands, acoustic performances, student choir, and stage lighting across the historic Patkar Hall.',
      imageUrl:
      'https://images.unsplash.com/photo-1501386761578-eac5c94b800a?q=80&w=900&auto=format&fit=crop',
      isPopular: true,
    ),
    const EventModel(
      id: '2',
      title: 'Tech Fest Mumbai 2026',
      category: 'Technology',
      date: '15-18 March 2026',
      time: '09:00 - 18:00',
      location: 'Juhu Campus, Mumbai',
      venue: 'Innovation Hub, SNDT Juhu, Mumbai',
      price: 300.0,
      eventType: 'Paid',
      eventFee: 300.0,
      attendeeCount: '5.2K',
      description:
      'Flagship technology symposium bringing AI hackathons, robotics challenges, paper presentations, and keynote talks from leading industry professionals in Mumbai.',
      imageUrl:
      'https://images.unsplash.com/photo-1540575467063-178a50c2df87?q=80&w=900&auto=format&fit=crop',
      isPopular: true,
    ),
    const EventModel(
      id: '3',
      title: 'Brightlight Youth Concert',
      category: 'Music Festival',
      date: '2-5 January 2027',
      time: '18:00 - 23:00',
      location: 'Marine Lines, Mumbai',
      venue: 'Open Air Amphitheatre, Mumbai',
      price: 200.0,
      eventType: 'Paid',
      eventFee: 200.0,
      attendeeCount: '6.9K',
      description:
      'Indie and fusion musical evening with student bands, live DJ sets, interactive campus food stalls, and acoustic jam sessions in South Mumbai.',
      imageUrl:
      'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?q=80&w=900&auto=format&fit=crop',
      isPopular: true,
    ),
    const EventModel(
      id: '4',
      title: 'Mumbai 24H Hackathon',
      category: 'Technology',
      date: '20-22 April 2026',
      time: '24 Hours Non-Stop',
      location: 'Churchgate, Mumbai',
      venue: 'Computer Science Lab Complex, Mumbai',
      price: 0.0,
      eventType: 'Free',
      eventFee: 0.0,
      attendeeCount: '3.1K',
      description:
      'A 24-hour sprint to build impactful solutions for smart campuses, green city initiatives, and web3 technologies with mentorship from Mumbai tech startups.',
      imageUrl:
      'https://images.unsplash.com/photo-1515187029135-18ee286d815b?q=80&w=900&auto=format&fit=crop',
      isPopular: false,
    ),
    const EventModel(
      id: '5',
      title: 'Kala Utsav Fine Arts Exhibition',
      category: 'Festival Arts',
      date: '25-27 April 2026',
      time: '10:00 - 19:00',
      location: 'Juhu Campus, Mumbai',
      venue: 'Art Gallery Quad, SNDT Mumbai',
      price: 100.0,
      eventType: 'Paid',
      eventFee: 100.0,
      attendeeCount: '4.8K',
      description:
      'Fine arts exhibition showcasing digital art installations, pottery studios, textile galleries, photography competitions, and live portrait painting.',
      imageUrl:
      'https://images.unsplash.com/photo-1460723237483-7a6dc9d0b212?q=80&w=900&auto=format&fit=crop',
      isPopular: true,
    ),
    const EventModel(
      id: '6',
      title: 'Inter-College Sports Championship',
      category: 'Sports',
      date: '5-8 May 2026',
      time: '08:00 - 17:00',
      location: 'Churchgate, Mumbai',
      venue: 'University Sports Complex, Mumbai',
      price: 0.0,
      eventType: 'Free',
      eventFee: 0.0,
      attendeeCount: '2.5K',
      description:
      'Annual sports meet featuring basketball, badminton, table tennis, and track events between colleges across Mumbai with trophies and certificates.',
      imageUrl:
      'https://images.unsplash.com/photo-1519766304817-4f37bda74a29?q=80&w=900&auto=format&fit=crop',
      isPopular: false,
    ),
  ];
}