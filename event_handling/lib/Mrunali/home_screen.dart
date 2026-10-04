
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

  final TextEditingController searchController =
  TextEditingController();

  final List<EventModel> allEvents = EventModel.sampleEvents;

  // All is kept internally as the default filter,
  // but it is not displayed as a category card.
  final List<String> categories = [
    "Music Festival",
    "Technology",
    "Festival Arts",
    "Sports",
  ];

  final Map<String, IconData> categoryIcons = {
    "Music Festival": Icons.music_note_rounded,
    "Technology": Icons.computer_rounded,
    "Festival Arts": Icons.palette_rounded,
    "Sports": Icons.sports_soccer_rounded,
  };

  final Map<String, Color> categoryColors = {
    "Music Festival": Color(0xFF8E2DE2),
    "Technology": Color(0xFF4A00E0),
    "Festival Arts": Color(0xFFFF8A65),
    "Sports": Color(0xFF35B779),
  };

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  List<EventModel> get popularEvents {
    return allEvents.where((event) => event.isPopular).toList();
  }

  // LIVE SEARCH

  List<EventModel> get searchResults {
    final query = searchQuery.trim().toLowerCase();

    if (query.isEmpty) {
      return [];
    }

    return allEvents.where((event) {
      final title = event.title.toLowerCase();
      final venue = event.venue.toLowerCase();
      final location = event.location.toLowerCase();

      return title.contains(query) ||
          venue.contains(query) ||
          location.contains(query);
    }).toList();
  }

  // CATEGORY FILTER

  List<EventModel> get filteredUpcomingEvents {
    return allEvents.where((event) {
      final matchesCategory = selectedCategory == "All" ||
          event.category.toLowerCase() ==
              selectedCategory.toLowerCase();

      return matchesCategory;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final bool isSearching = searchQuery.trim().isNotEmpty;

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
                    color: const Color(0xFF4A00E0)
                        .withOpacity(0.3),
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

              // GREETING

              if (!isSearching) ...[
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
              ],

              // SEARCH BAR

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
                    controller: searchController,
                    textInputAction: TextInputAction.search,

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
                          searchController.clear();
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

              const SizedBox(height: 20),

              // SEARCH RESULTS

              if (isSearching) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "${searchResults.length} events found",
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F1F1F),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                if (searchResults.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: _emptyState(
                      "No matching events found",
                      compact: true,
                    ),
                  )
                else
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: EventCard(
                          event: searchResults[index],
                        ),
                      );
                    },
                  ),
              ]

              // NORMAL HOME SCREEN

              else ...[
                // FEATURED EVENTS

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
                        padding:
                        const EdgeInsets.only(right: 12),
                        child: _featuredCard(
                          popularEvents[index],
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 28),

                // EXPLORE CATEGORIES

                _sectionTitle(
                  "Explore Categories",
                  "",
                      () {},
                ),

                const SizedBox(height: 13),

                SizedBox(
                  height: 105,
                  child: ListView.builder(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20),
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

                // UPCOMING EVENTS

                _sectionTitle(
                  selectedCategory == "All"
                      ? "Upcoming Events"
                      : "$selectedCategory Events",
                  "View all",
                      () {
                    Navigator.pushNamed(context, '/events');
                  },
                ),

                const SizedBox(height: 13),

                if (filteredUpcomingEvents.isEmpty)
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20),
                    child: _emptyState(
                      "No events found",
                      compact: true,
                    ),
                  )
                else
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20),

                    // Show only 4 cards on HomeScreen.
                    itemCount: filteredUpcomingEvents.length > 4
                        ? 4
                        : filteredUpcomingEvents.length,

                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                        const EdgeInsets.only(bottom: 14),
                        child: EventCard(
                          event: filteredUpcomingEvents[index],
                        ),
                      );
                    },
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }

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
                  color: Color(0xFF6C4AB6),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _featuredCard(EventModel event) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/event-detail',
          arguments: event,
        );
      },

      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF6C4AB6).withOpacity(0.15),
              blurRadius: 15,
              offset: const Offset(0, 7),
            ),
          ],
        ),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),

          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                event.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade300,
                    child: const Icon(
                      Icons.image_not_supported,
                      size: 40,
                      color: Colors.grey,
                    ),
                  );
                },
              ),

              Container(
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

              Positioned(
                top: 14,
                left: 14,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF6C4AB6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 14,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "Popular",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                bottom: 15,
                left: 17,
                right: 17,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.category,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 5),

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

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          color: Colors.white,
                          size: 14,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          event.date,
                          style: const TextStyle(
                            color: Colors.white,
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
      ),
    );
  }

  // CATEGORY CARD

  Widget _categoryCard(
      String category,
      IconData icon,
      Color color,
      ) {
    final bool isSelected = selectedCategory == category;

    String displayName = category;

    if (category == "Music Festival") {
      displayName = "Music";
    } else if (category == "Festival Arts") {
      displayName = "Arts";
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          // Tapping the selected category again
          // resets the filter to all events.
          selectedCategory =
          isSelected ? "All" : category;
        });
      },

      child: Container(
        width: 95,
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 12,
        ),

        decoration: BoxDecoration(
          color: isSelected
              ? color.withOpacity(0.15)
              : Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isSelected
                ? color
                : Colors.grey.shade200,
            width: isSelected ? 1.5 : 1,
          ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
              size: 28,
            ),

            const SizedBox(height: 8),

            Text(
              displayName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isSelected ? color : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _emptyState(
      String message, {
        bool compact = false,
      }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: compact ? 25 : 45,
      ),

      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.event_busy,
              size: compact ? 38 : 48,
              color: Colors.grey.shade400,
            ),

            const SizedBox(height: 10),

            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}