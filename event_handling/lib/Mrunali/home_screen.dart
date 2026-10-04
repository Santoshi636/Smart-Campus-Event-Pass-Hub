import 'package:flutter/material.dart';
import '../models/event_model.dart';
import 'category_screen.dart';
import 'event_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = "All";
  String searchQuery = "";

  // Using sampleEvents from the updated EventModel
  final List<EventModel> allEvents = EventModel.sampleEvents;

  @override
  Widget build(BuildContext context) {
    // Separate Ongoing vs Upcoming Events
    final ongoingEvents = allEvents.where((e) => e.date.toLowerCase().contains("now")).toList();
    final upcomingEvents = allEvents.where((e) => !e.date.toLowerCase().contains("now")).toList();

    // Filter logic for categories & search query
    final filteredUpcoming = upcomingEvents.where((e) {
      final matchesCategory = selectedCategory == "All" || e.category == selectedCategory;
      final matchesSearch = e.title.toLowerCase().contains(searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Smart Campus Hub"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF4A00E0), Color(0xFF8E2DE2)],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              onChanged: (val) => setState(() => searchQuery = val),
              decoration: InputDecoration(
                hintText: "Search events...",
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Category Filter Chips
            CategoryChips(
              selectedCategory: selectedCategory,
              onCategorySelected: (cat) => setState(() => selectedCategory = cat),
            ),
            const SizedBox(height: 24),

            // 🔴 SECTION 1: ONGOING EVENTS
            if (ongoingEvents.isNotEmpty && searchQuery.isEmpty) ...[
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Ongoing Events",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ...ongoingEvents.map((event) => EventCard(event: event)),
              const SizedBox(height: 20),
            ],

            // 📅 SECTION 2: UPCOMING EVENTS (Max 2-3 items)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Upcoming Events",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    // Navigates to Member 2's Full Catalog
                    Navigator.pushNamed(context, '/events');
                  },
                  child: const Row(
                    children: [
                      Text(
                        "View All",
                        style: TextStyle(
                          color: Color(0xFF4A00E0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Color(0xFF4A00E0)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Displays top 2-3 upcoming events on Home Feed
            filteredUpcoming.isEmpty
                ? const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text("No upcoming events found."),
              ),
            )
                : Column(
              children: filteredUpcoming
                  .take(3) // Limits Home Screen to top 3 upcoming events
                  .map((event) => EventCard(event: event))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}