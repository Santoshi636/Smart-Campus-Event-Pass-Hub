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
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Welcome text
            const Text(
              'Hello, Student 👋',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'Discover Events',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // SEARCH BAR
            const CustomSearchBar(),

            const SizedBox(height: 30),

            // CATEGORY TITLE
            const SectionTitle(
              title: 'Categories',),

            const SizedBox(height: 15),

            // CATEGORIES
            SizedBox(
              height: 105,

              child: ListView(
                scrollDirection: Axis.horizontal,

                children: [
                  CategoryItem(
                    icon: Icons.computer,
                    title: 'Technical',
                    onTap: () {},
                  ),

                  const SizedBox(width: 18),

                  CategoryItem(
                    icon: Icons.theater_comedy,
                    title: 'Cultural',
                    onTap: () {},
                  ),

                  const SizedBox(width: 18),

                  CategoryItem(
                    icon: Icons.sports_soccer,
                    title: 'Sports',
                    onTap: () {},
                  ),

                  const SizedBox(width: 18),

                  CategoryItem(
                    icon: Icons.music_note,
                    title: 'Music',
                    onTap: () {},
                  ),

                  const SizedBox(width: 18),

                  CategoryItem(
                    icon: Icons.groups,
                    title: 'Clubs',
                    onTap: () {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // EVENTS TITLE
            const SectionTitle(
              title: 'Upcoming Events',
            ),

            const SizedBox(height: 15),

            // EVENT 1
            EventCard(
              title: 'Tech Fest 2026',
              category: 'Technical',
              date: '15 October 2026',
              location: 'Main Auditorium',
              imageUrl:
              'https://images.unsplash.com/photo-1517245386807-bb43f82c33c4',
              onTap: () {
                // Member 2 can connect Event Details here.
              },
            ),

            // EVENT 2
            EventCard(
              title: 'Cultural Night',
              category: 'Cultural',
              date: '20 October 2026',
              location: 'College Ground',
              imageUrl:
              'https://images.unsplash.com/photo-1501386761578-eac5c94b800a',
              onTap: () {
                // Member 2 can connect Event Details here.
              },
            ),

            // EVENT 3
            EventCard(
              title: 'Inter College Sports',
              category: 'Sports',
              date: '25 October 2026',
              location: 'Sports Complex',
              imageUrl:
              'https://images.unsplash.com/photo-1461896836934-ffe607ba8211',
              onTap: () {
                // Member 2 can connect Event Details here.
              },
            ),
          ],
        ),
      ),
    );
  }
}
