import 'package:flutter/material.dart';

import '../widgets/category_item.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/event_card.dart';
import '../widgets/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Smart Campus',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Welcome
            const Text(
              'Welcome! 👋',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'Discover events happening on your campus.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 20),

            // Search
            const CustomSearchBar(),

            const SizedBox(height: 25),

            // Categories
            const SectionTitle(
              title: 'Categories',
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 105,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [

                  CategoryItem(
                    icon: Icons.music_note,
                    title: 'Music',
                  ),

                  CategoryItem(
                    icon: Icons.sports_basketball,
                    title: 'Sports',
                  ),

                  CategoryItem(
                    icon: Icons.code,
                    title: 'Technology',
                  ),

                  CategoryItem(
                    icon: Icons.palette,
                    title: 'Arts',
                  ),

                  CategoryItem(
                    icon: Icons.groups,
                    title: 'Clubs',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Upcoming Events heading + View All
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SectionTitle(
                  title: 'Upcoming Events',
                ),

                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/events');
                  },
                  child: const Text(
                    'View All',
                    style: TextStyle(
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Only preview events
            const EventCard(
              title: 'Annual College Fest',
              date: '15 October 2026',
              location: 'College Auditorium',
              icon: Icons.celebration,
            ),

            const EventCard(
              title: 'Coding Competition',
              date: '20 October 2026',
              location: 'Computer Lab',
              icon: Icons.computer,
            ),

            const EventCard(
              title: 'Sports Day',
              date: '25 October 2026',
              location: 'College Ground',
              icon: Icons.sports,
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}