import 'package:flutter/material.dart';
import '../models/event_model.dart';
import 'event_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = "All";
  String searchQuery = "";

  final List<EventModel> allEvents = EventModel.sampleEvents;

  final List<String> categories = [
    "All",
    "Music Festival",
    "Technology",
    "Festival Arts",
    "Sports",
  ];

  final Map<String, IconData> categoryIcons = {
    "All": Icons.apps_rounded,
    "Music Festival": Icons.music_note_rounded,
    "Technology": Icons.computer_rounded,
    "Festival Arts": Icons.palette_rounded,
    "Sports": Icons.sports_soccer_rounded,
  };

  final Map<String, Color> categoryColors = {
    "All": const Color(0xFF4A00E0),
    "Music Festival": const Color(0xFF8E2DE2),
    "Technology": const Color(0xFF4A00E0),
    "Festival Arts": const Color(0xFFFF8A65),
    "Sports": const Color(0xFF35B779),
  };

  List<EventModel> get popularEvents {
    return allEvents.where((event) => event.isPopular).toList();
  }

  List<EventModel> get ongoingEvents {
    return allEvents
        .where((event) => event.date.toLowerCase().contains("now"))
        .toList();
  }

  List<EventModel> get filteredUpcomingEvents {
    return allEvents.where((event) {
      final matchesCategory = selectedCategory == "All" ||
          event.category == selectedCategory;

      final query = searchQuery.toLowerCase().trim();

      final matchesSearch = query.isEmpty ||
          event.title.toLowerCase().contains(query) ||
          event.category.toLowerCase().contains(query);

      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FA),
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 20,
        title: Row(
          children: [
            Container(
              height: 42,
              width: 42,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF4A00E0),
                    Color(0xFF8E2DE2),
                  ],
                ),
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF4A00E0).withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Icon(
                Icons.school_rounded,
                color: Colors.white,
                size: 22,
              ),
            ),

            const SizedBox(width: 12),

            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Smart Campus Hub",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F1F1F),
                  ),
                ),
                Text(
                  "Events & Pass",
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            const Spacer(),

            Container(
              height: 42,
              width: 42,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_none_rounded,
                  color: Color(0xFF4A00E0),
                ),
              ),
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ------------------------------------------------------------
              // GREETING
              // ------------------------------------------------------------

              const Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 4),
                child: Text(
                  "Hello, Student 👋",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F1F1F),
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Discover what's happening on your campus",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // ------------------------------------------------------------
              // SEARCH BAR
              // ------------------------------------------------------------

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 54,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(17),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Search events, venues...",
                      hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 14,
                      ),
                      prefixIcon: const Icon(
                        Icons.search_rounded,
                        color: Color(0xFF4A00E0),
                      ),
                      suffixIcon: searchQuery.isNotEmpty
                          ? IconButton(
                        onPressed: () {
                          setState(() {
                            searchQuery = "";
                          });
                        },
                        icon: const Icon(
                          Icons.close_rounded,
                          color: Colors.grey,
                        ),
                      )
                          : IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.tune_rounded,
                          color: Color(0xFF4A00E0),
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding:
                      const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // ------------------------------------------------------------
              // FEATURED EVENTS
              // ------------------------------------------------------------

              _sectionTitle(
                "Featured Events",
                "View all",
                    () {
                  Navigator.pushNamed(context, '/events');
                },
              ),

              const SizedBox(height: 13),

              SizedBox(
                height: 205,
                child: popularEvents.isEmpty
                    ? _emptyState("No featured events available")
                    : PageView.builder(
                  controller: PageController(
                    viewportFraction: 0.88,
                  ),
                  itemCount: popularEvents.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: _featuredCard(
                        popularEvents[index],
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 28),

              // ------------------------------------------------------------
              // CATEGORIES
              // ------------------------------------------------------------

              _sectionTitle(
                "Explore Categories",
                "",
                    () {},
              ),

              const SizedBox(height: 13),

              SizedBox(
                height: 105,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];

                    return _categoryCard(
                      category,
                      categoryIcons[category]!,
                      categoryColors[category]!,
                    );
                  },
                ),
              ),

              const SizedBox(height: 28),

              // ------------------------------------------------------------
              // LIVE NOW
              // ------------------------------------------------------------

              _sectionTitle(
                "Happening Now",
                "See all",
                    () {
                  Navigator.pushNamed(context, '/events');
                },
              ),

              const SizedBox(height: 13),

              if (ongoingEvents.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: _emptyState(
                    "No live events right now",
                    compact: true,
                  ),
                )
              else
                SizedBox(
                  height: 190,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.horizontal,
                    itemCount: ongoingEvents.length,
                    itemBuilder: (context, index) {
                      return _liveEventCard(
                        ongoingEvents[index],
                      );
                    },
                  ),
                ),

              const SizedBox(height: 28),

              // ------------------------------------------------------------
              // UPCOMING EVENTS
              // ------------------------------------------------------------

              _sectionTitle(
                "Upcoming Events",
                "View all",
                    () {
                  Navigator.pushNamed(context, '/events');
                },
              ),

              const SizedBox(height: 13),

              if (filteredUpcomingEvents.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: _emptyState(
                    "No events found",
                    compact: true,
                  ),
                )
              else
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: filteredUpcomingEvents.length > 5
                      ? 5
                      : filteredUpcomingEvents.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: EventCard(
                        event: filteredUpcomingEvents[index],
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  // ========================================================================
  // SECTION TITLE
  // ========================================================================

  Widget _sectionTitle(
      String title,
      String action,
      VoidCallback onTap,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F1F1F),
            ),
          ),

          const Spacer(),

          if (action.isNotEmpty)
            GestureDetector(
              onTap: onTap,
              child: const Text(
                "View all",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF4A00E0),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // ========================================================================
  // FEATURED CARD
  // ========================================================================

  Widget _featuredCard(EventModel event) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF4A00E0).withOpacity(0.15),
            blurRadius: 18,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [

            // INTERNET IMAGE
            Positioned.fill(
              child: Image.network(
                event.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFFEFE8FF),
                    child: const Center(
                      child: Icon(
                        Icons.image_not_supported_rounded,
                        size: 45,
                        color: Color(0xFF4A00E0),
                      ),
                    ),
                  );
                },
              ),
            ),

            // DARK GRADIENT
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.80),
                    ],
                  ),
                ),
              ),
            ),

            // POPULAR LABEL
            Positioned(
              top: 14,
              left: 14,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 11,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF8E2DE2),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.star_rounded,
                      size: 14,
                      color: Colors.amber,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "Popular",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // EVENT DETAILS
            Positioned(
              left: 17,
              right: 17,
              bottom: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.category,
                    style: const TextStyle(
                      color: Color(0xFFD6C7FF),
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    event.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month_rounded,
                        size: 14,
                        color: Colors.white70,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        event.date,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
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

  // ========================================================================
  // CATEGORY CARD
  // ========================================================================

  Widget _categoryCard(
      String category,
      IconData icon,
      Color color,
      ) {
    final bool isSelected = selectedCategory == category;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = category;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 92,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          gradient: isSelected
              ? const LinearGradient(
            colors: [Color(0xFF4A00E0), Color(0xFF8E2DE2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
              : null,
          color: isSelected ? null : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? Colors.transparent
                : const Color(0xFFE8EDF5),
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? const Color(0xFF4A00E0).withOpacity(0.3)
                  : Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 43,
              width: 43,
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.white.withOpacity(0.20)
                    : color.withOpacity(0.10),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: isSelected ? Colors.white : color,
                size: 22,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              category == "Festival Arts"
                  ? "Arts"
                  : category == "Music Festival"
                  ? "Music"
                  : category,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? Colors.white
                    : const Color(0xFF4B5563),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ========================================================================
  // LIVE EVENT CARD
  // ========================================================================

  Widget _liveEventCard(EventModel event) {
    return Container(
      width: 245,
      margin: const EdgeInsets.only(right: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // INTERNET IMAGE
            SizedBox(
              height: 105,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      event.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder:
                          (context, error, stackTrace) {
                        return Container(
                          color: const Color(0xFFEFE8FF),
                          child: const Center(
                            child: Icon(
                              Icons.image_not_supported_rounded,
                              color: Color(0xFF4A00E0),
                              size: 35,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 9,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red.shade600,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 7,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "LIVE NOW",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(
                13,
                10,
                13,
                10,
              ),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    event.category,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Color(0xFF4A00E0),
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 3),

                  Text(
                    event.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F1F1F),
                    ),
                  ),

                  const SizedBox(height: 4),

                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 13,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 3),
                      Expanded(
                        child: Text(
                          event.venue.isNotEmpty ? event.venue : "Campus Venue",
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
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

  // ========================================================================
  // EMPTY STATE
  // ========================================================================

  Widget _emptyState(
      String message, {
        bool compact = false,
      }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: compact ? 22 : 40,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Icon(
            Icons.event_busy_rounded,
            size: compact ? 30 : 45,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}