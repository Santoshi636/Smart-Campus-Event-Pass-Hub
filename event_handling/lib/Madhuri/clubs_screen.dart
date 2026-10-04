import 'package:flutter/material.dart';
import 'event_data.dart';

// Purple theme constants — matches Mrunali folder
const _kPrimary   = Color(0xFF4A00E0);
const _kSecondary = Color(0xFF8E2DE2);
const _kTextDark  = Color(0xFF1A1A2E);
const _kTextMuted = Color(0xFF7A7A9D);
const _kScaffold  = Color(0xFFF7F7FB);

/// Member 4 — Campus Clubs screen.
/// Category filter, club cards with join/leave toggle, purple theme.
class ClubsScreen extends StatefulWidget {
  const ClubsScreen({super.key});

  @override
  State<ClubsScreen> createState() => _ClubsScreenState();
}

class _ClubsScreenState extends State<ClubsScreen> {
  List<ClubModel> _clubs           = ClubModel.sampleClubs;
  String          _selectedCategory = 'All';

  static const List<String> _filters = [
    'All', 'Technology', 'Music', 'Arts', 'Sports', 'Cultural', 'Academic',
  ];

  List<ClubModel> get _filtered {
    if (_selectedCategory == 'All') return _clubs;
    return _clubs
        .where((c) => c.category == _selectedCategory)
        .toList();
  }

  void _toggle(String id) {
    setState(() {
      _clubs = _clubs.map((c) {
        if (c.id != id) return c;
        return ClubModel(
          id: c.id,
          name: c.name,
          description: c.description,
          category: c.category,
          icon: c.icon,
          color: c.color,
          memberCount:
              c.isJoined ? c.memberCount - 1 : c.memberCount + 1,
          isJoined: !c.isJoined,
        );
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final joined = _clubs.where((c) => c.isJoined).length;

    return Scaffold(
      backgroundColor: _kScaffold,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Campus Clubs',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [_kPrimary, _kSecondary],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: Colors.white.withValues(alpha: 0.4)),
                ),
                child: Text(
                  '$joined joined',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: Colors.white12),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Category Filter ────────────────────────────────
          SizedBox(
            height: 56,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 10),
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: _filters.length,
              separatorBuilder: (_, __) =>
                  const SizedBox(width: 8),
              itemBuilder: (context, i) {
                final cat        = _filters[i];
                final isSelected = cat == _selectedCategory;
                return GestureDetector(
                  onTap: () =>
                      setState(() => _selectedCategory = cat),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 7),
                    decoration: BoxDecoration(
                      gradient: isSelected
                          ? const LinearGradient(
                              colors: [_kPrimary, _kSecondary])
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
                              ? _kPrimary.withValues(alpha: 0.3)
                              : Colors.black
                                  .withValues(alpha: 0.04),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Text(
                      cat,
                      style: TextStyle(
                        color:
                            isSelected ? Colors.white : _kTextDark,
                        fontWeight: isSelected
                            ? FontWeight.w700
                            : FontWeight.w600,
                        fontSize: 12.5,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // ── Count label ───────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 2, 18, 6),
            child: Text(
              '${_filtered.length} club${_filtered.length == 1 ? '' : 's'}',
              style: const TextStyle(
                color: _kTextMuted,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          // ── Club List ─────────────────────────────────────
          Expanded(
            child: _filtered.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.group_off_rounded,
                            size: 56,
                            color: Colors.grey.shade300),
                        const SizedBox(height: 14),
                        Text(
                          'No clubs in this category',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding:
                        const EdgeInsets.fromLTRB(16, 4, 16, 30),
                    physics: const BouncingScrollPhysics(),
                    itemCount: _filtered.length,
                    itemBuilder: (context, i) {
                      final club = _filtered[i];
                      return _ClubCard(
                        club: club,
                        onToggle: () => _toggle(club.id),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

// ── Club Card ─────────────────────────────────────────────────
class _ClubCard extends StatelessWidget {
  final ClubModel  club;
  final VoidCallback onToggle;

  const _ClubCard({required this.club, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon circle
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    _kPrimary.withValues(alpha: 0.15),
                    _kSecondary.withValues(alpha: 0.08),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(club.icon, color: _kPrimary, size: 26),
            ),
            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name + category tag
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          club.name,
                          style: const TextStyle(
                            color: _kTextDark,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: _kPrimary.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          club.category,
                          style: const TextStyle(
                            color: _kPrimary,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),

                  Text(
                    club.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: _kTextMuted,
                      fontSize: 12.5,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Members + Join button
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.people_alt_rounded,
                              size: 14, color: _kTextMuted),
                          const SizedBox(width: 4),
                          Text(
                            '${club.memberCount} members',
                            style: const TextStyle(
                                color: _kTextMuted, fontSize: 12),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: onToggle,
                        child: AnimatedContainer(
                          duration:
                              const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 8),
                          decoration: BoxDecoration(
                            gradient: club.isJoined
                                ? null
                                : const LinearGradient(colors: [
                                    _kPrimary,
                                    _kSecondary
                                  ]),
                            color: club.isJoined
                                ? Colors.white
                                : null,
                            borderRadius:
                                BorderRadius.circular(20),
                            border: Border.all(
                              color: _kPrimary,
                              width: 1.5,
                            ),
                            boxShadow: club.isJoined
                                ? []
                                : [
                                    BoxShadow(
                                      color: _kPrimary
                                          .withValues(alpha: 0.3),
                                      blurRadius: 8,
                                      offset:
                                          const Offset(0, 3),
                                    )
                                  ],
                          ),
                          child: Text(
                            club.isJoined ? 'Joined ✓' : 'Join',
                            style: TextStyle(
                              color: club.isJoined
                                  ? _kPrimary
                                  : Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
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
}
