import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String title;
  final IconData icon;

  const CategoryModel({
    required this.id,
    required this.title,
    required this.icon,
  });

  static List<CategoryModel> get sampleCategories => [
        const CategoryModel(
          id: 'all',
          title: 'All Events',
          icon: Icons.grid_view_rounded,
        ),
        const CategoryModel(
          id: 'music',
          title: 'Music Festival',
          icon: Icons.music_note_rounded,
        ),
        const CategoryModel(
          id: 'arts',
          title: 'Festival Arts',
          icon: Icons.palette_rounded,
        ),
        const CategoryModel(
          id: 'tech',
          title: 'Technology',
          icon: Icons.laptop_mac_rounded,
        ),
        const CategoryModel(
          id: 'sports',
          title: 'Sports',
          icon: Icons.sports_basketball_rounded,
        ),
        const CategoryModel(
          id: 'cultural',
          title: 'Cultural',
          icon: Icons.theater_comedy_rounded,
        ),
      ];
}
