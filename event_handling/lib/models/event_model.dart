
class EventModel {
  final String id;
  final String title;
  final String category;
  final String date;
  final String time;
  final String location;
  final String venue;
  final double price;
  final String eventType;
  final double eventFee;
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
    // 1. MUSIC FESTIVAL
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

    // 2. TECHNOLOGY
    const EventModel(
      id: '2',
      title: 'Tech Fest Mumbai 2026',
      category: 'Technology',
      date: '15-18 March 2027',
      time: '09:00 - 18:00',
      location: 'Juhu, Mumbai',
      venue: 'Innovation Hub, SNDT Juhu, Mumbai',
      price: 300.0,
      eventType: 'Paid',
      eventFee: 300.0,
      attendeeCount: '5.2K',
      description:
      'Flagship technology symposium bringing AI hackathons, robotics challenges, paper presentations, and keynote talks from leading industry professionals.',
      imageUrl:
      'https://images.unsplash.com/photo-1540575467063-178a50c2df87?q=80&w=900&auto=format&fit=crop',
      isPopular: true,
    ),

    // 3. MUSIC FESTIVAL
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
      'Indie and fusion musical evening with student bands, live DJ sets, interactive campus food stalls, and acoustic jam sessions.',
      imageUrl:
      'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?q=80&w=900&auto=format&fit=crop',
      isPopular: true,
    ),

    // 4. TECHNOLOGY
    const EventModel(
      id: '4',
      title: 'Mumbai 24H Hackathon',
      category: 'Technology',
      date: '20-22 April 2027',
      time: '24 Hours Non-Stop',
      location: 'Churchgate, Mumbai',
      venue: 'Computer Science Lab Complex, Mumbai',
      price: 0.0,
      eventType: 'Free',
      eventFee: 0.0,
      attendeeCount: '3.1K',
      description:
      'A 24-hour sprint to build impactful solutions for smart campuses, green city initiatives, and web technologies with mentorship from Mumbai tech startups.',
      imageUrl:
      'https://images.unsplash.com/photo-1515187029135-18ee286d815b?q=80&w=900&auto=format&fit=crop',
      isPopular: false,
    ),

    // 5. FESTIVAL ARTS
    const EventModel(
      id: '5',
      title: 'Kala Utsav Fine Arts Exhibition',
      category: 'Festival Arts',
      date: '25-27 April 2027',
      time: '10:00 - 19:00',
      location: 'Juhu, Mumbai',
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

    // 6. SPORTS
    const EventModel(
      id: '6',
      title: 'Inter-College Sports Championship',
      category: 'Sports',
      date: '5-8 May 2027',
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

    // 7. MUSIC FESTIVAL
    const EventModel(
      id: '7',
      title: 'Bandra Beats Music Night',
      category: 'Music Festival',
      date: '12-14 June 2027',
      time: '18:00 - 23:00',
      location: 'Bandra West, Mumbai',
      venue: 'Carter Road Amphitheatre, Bandra',
      price: 350.0,
      eventType: 'Paid',
      eventFee: 350.0,
      attendeeCount: '7.2K',
      description:
      'An energetic music night featuring independent artists, acoustic performances, campus bands, and live entertainment.',
      imageUrl:
      'https://images.unsplash.com/photo-1459749411175-04bf5292ceea?q=80&w=900&auto=format&fit=crop',
      isPopular: true,
    ),

    // 8. TECHNOLOGY
    const EventModel(
      id: '8',
      title: 'AI Innovation Summit',
      category: 'Technology',
      date: '18-20 June 2027',
      time: '10:00 - 17:00',
      location: 'Powai, Mumbai',
      venue: 'Innovation Convention Centre, Powai',
      price: 150.0,
      eventType: 'Paid',
      eventFee: 150.0,
      attendeeCount: '4.3K',
      description:
      'Explore artificial intelligence, machine learning, automation, and future technology through workshops and student presentations.',
      imageUrl:
      'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?q=80&w=900&auto=format&fit=crop',
      isPopular: true,
    ),

    // 9. FESTIVAL ARTS
    const EventModel(
      id: '9',
      title: 'Mumbai Canvas Art Carnival',
      category: 'Festival Arts',
      date: '22-24 July 2027',
      time: '11:00 - 20:00',
      location: 'Kala Ghoda, Fort, Mumbai',
      venue: 'Kala Ghoda Art District',
      price: 0.0,
      eventType: 'Free',
      eventFee: 0.0,
      attendeeCount: '3.8K',
      description:
      'A creative carnival featuring student paintings, street art, photography, handmade crafts, and interactive art installations.',
      imageUrl:
      'https://images.unsplash.com/photo-1541961017774-22349e4a1262?q=80&w=900&auto=format&fit=crop',
      isPopular: false,
    ),

    // 10. SPORTS
    const EventModel(
      id: '10',
      title: 'Mumbai Football League',
      category: 'Sports',
      date: '1-4 August 2027',
      time: '09:00 - 18:00',
      location: 'Andheri West, Mumbai',
      venue: 'Andheri Sports Complex',
      price: 100.0,
      eventType: 'Paid',
      eventFee: 100.0,
      attendeeCount: '5.6K',
      description:
      'Inter-college football tournament with competitive matches, team challenges, medals, and championship awards.',
      imageUrl:
      'https://images.unsplash.com/photo-1574629810360-7efbbe195018?q=80&w=900&auto=format&fit=crop',
      isPopular: true,
    ),

    // 11. TECHNOLOGY
    const EventModel(
      id: '11',
      title: 'Robotics Challenge 2027',
      category: 'Technology',
      date: '10-12 August 2027',
      time: '09:30 - 17:30',
      location: 'Vashi, Navi Mumbai',
      venue: 'Engineering Innovation Centre, Vashi',
      price: 200.0,
      eventType: 'Paid',
      eventFee: 200.0,
      attendeeCount: '2.9K',
      description:
      'Students compete in robotics, automation, line-following challenges, and creative engineering competitions.',
      imageUrl:
      'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?q=80&w=900&auto=format&fit=crop',
      isPopular: false,
    ),

    // 12. MUSIC FESTIVAL
    const EventModel(
      id: '12',
      title: 'Monsoon Acoustic Sessions',
      category: 'Music Festival',
      date: '20-22 August 2027',
      time: '17:00 - 21:30',
      location: 'Dadar West, Mumbai',
      venue: 'Shivaji Park Cultural Stage',
      price: 150.0,
      eventType: 'Paid',
      eventFee: 150.0,
      attendeeCount: '3.7K',
      description:
      'Relaxed acoustic performances, unplugged student bands, poetry, and live musical collaborations.',
      imageUrl:
      'https://images.unsplash.com/photo-1516280440614-37939bbacd81?q=80&w=900&auto=format&fit=crop',
      isPopular: false,
    ),

    // 13. FESTIVAL ARTS
    const EventModel(
      id: '13',
      title: 'Creative Minds Design Expo',
      category: 'Festival Arts',
      date: '5-7 September 2027',
      time: '10:00 - 18:00',
      location: 'Borivali West, Mumbai',
      venue: 'Creative Arts Exhibition Hall, Borivali',
      price: 80.0,
      eventType: 'Paid',
      eventFee: 80.0,
      attendeeCount: '2.2K',
      description:
      'A design showcase featuring fashion, graphic design, handmade products, student portfolios, and creative workshops.',
      imageUrl:
      'https://images.unsplash.com/photo-1531058020387-3be344556be6?q=80&w=900&auto=format&fit=crop',
      isPopular: false,
    ),

    // 14. SPORTS
    const EventModel(
      id: '14',
      title: 'Campus Marathon 2027',
      category: 'Sports',
      date: '15-16 September 2027',
      time: '06:00 - 11:00',
      location: 'Thane West, Mumbai Metropolitan Region',
      venue: 'Thane Central Sports Ground',
      price: 50.0,
      eventType: 'Paid',
      eventFee: 50.0,
      attendeeCount: '6.1K',
      description:
      'A community fitness event with 5K and 10K running categories, student participation, medals, and wellness activities.',
      imageUrl:
      'https://images.unsplash.com/photo-1530549387789-4c1017266635?q=80&w=900&auto=format&fit=crop',
      isPopular: false,
    ),
  ];
}