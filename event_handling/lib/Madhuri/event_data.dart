import 'package:flutter/material.dart';

/// Model representing a Campus Club.
class ClubModel {
  final String id;
  final String name;
  final String description;
  final String category;
  final IconData icon;
  final Color color;
  final int memberCount;
  final bool isJoined;

  const ClubModel({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.icon,
    required this.color,
    required this.memberCount,
    this.isJoined = false,
  });

  static List<ClubModel> get sampleClubs => const [
        ClubModel(
          id: 'c1',
          name: 'TechForge Society',
          description:
              'A community of tech enthusiasts working on AI, robotics and web3 projects together.',
          category: 'Technology',
          icon: Icons.memory_rounded,
          color: Color(0xFF4A00E0),
          memberCount: 312,
          isJoined: true,
        ),
        ClubModel(
          id: 'c2',
          name: 'Campus Music Guild',
          description:
              'Bringing together vocalists, instrumentalists and music producers from across campus.',
          category: 'Music',
          icon: Icons.music_note_rounded,
          color: Color(0xFFFF6B35),
          memberCount: 204,
        ),
        ClubModel(
          id: 'c3',
          name: 'Fine Arts Collective',
          description:
              'Explore painting, sculpture, photography and digital art with fellow creatives.',
          category: 'Arts',
          icon: Icons.palette_rounded,
          color: Color(0xFF8E2DE2),
          memberCount: 178,
        ),
        ClubModel(
          id: 'c4',
          name: 'Sports Champions Club',
          description:
              'Compete and train across basketball, badminton, table tennis and athletics.',
          category: 'Sports',
          icon: Icons.sports_basketball_rounded,
          color: Color(0xFF00C853),
          memberCount: 256,
          isJoined: true,
        ),
        ClubModel(
          id: 'c5',
          name: 'Cultural Heritage Circle',
          description:
              'Celebrate and preserve diverse cultural traditions through performances and festivals.',
          category: 'Cultural',
          icon: Icons.theater_comedy_rounded,
          color: Color(0xFFE91E8C),
          memberCount: 143,
        ),
        ClubModel(
          id: 'c6',
          name: 'Debate & Oratory Forum',
          description:
              'Sharpen your public speaking, argumentation and critical thinking skills.',
          category: 'Academic',
          icon: Icons.record_voice_over_rounded,
          color: Color(0xFF0288D1),
          memberCount: 98,
        ),
      ];
}
