import 'package:flutter/material.dart';
import '../models/event_model.dart';
import '../models/category_model.dart';
import 'event_details_screen.dart';

// Purple theme constants — matches Mrunali folder
const _kPrimary   = Color(0xFF4A00E0);
const _kSecondary = Color(0xFF8E2DE2);
const _kTextDark  = Color(0xFF1A1A2E);
const _kTextMuted = Color(0xFF7A7A9D);
const _kScaffold  = Color(0xFFF7F7FB);

/// Member 4 — Full event catalogue with search + category chips.
class MadhuriEventsScreen extends StatefulWidget {
  const MadhuriEventsScreen({super.key});

  @override
  State<MadhuriEventsScreen> createState() => _MadhuriEventsScreenState();
}

class _MadhuriEventsScreenState extends State<MadhuriEventsScreen> {
  final List<EventModel>    _all        = EventModel.sampleEvents;
  final List<CategoryModel> _categories = CategoryModel.sampleCategories;
  String _selectedCategory = 'all';
  String _searchQuery      = '';

  List<EventModel> get _filtered {
    List<EventModel> r = _all;
    if (_selectedCategory != 'all') {
      final cat = _categories.firstWhere(
        (c) => c.id == _selectedCategory,
        orElse: () => _categories.first,
      );
      r = r
          .where((e) =>
              e.category
                  .toLowerCase()
                  .contains(cat.title.toLowerCase()) ||
              cat.title
                  .toLowerCase()
                  .contains(e.category.toLowerCase()))
          .toList();
    }
    if (_searchQuery.isNotEmpty) {
      r = r
          .where((e) =>
              e.title
                  .toLowerCase()
                  .contains(_searchQuery.toLowerCase()) ||
              e.location
                  .toLowerCase()
                  .contains(_searchQuery.toLowerCase()))
          .toList();
    }
    return r;
  }

  void _open(EventModel event) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => MadhuriEventDetailScreen(event: event)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _kScaffold,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'All Campus Events',
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
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: Colors.white12),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Search Bar ─────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: TextField(
              onChanged: (v) => setState(() => _searchQuery = v),
              style: const TextStyle(color: _kTextDark, fontSize: 14),
              decoration: InputDecoration(
                hintText: 'Search events or locations...',
                hintStyle:
                    const TextStyle(color: _kTextMuted, fontSize: 14),
                prefixIcon: const Icon(Icons.search_rounded,
                    color: _kPrimary, size: 22),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 13),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                      color: Color(0xFFE8EDF5), width: 1.2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide:
                      const BorderSide(color: _kPrimary, width: 1.5),
                ),
              ),
            ),
          ),

          // ── Category Chips ────────────────────────────────
          SizedBox(
            height: 58,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 10),
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: _categories.length,
              separatorBuilder: (_, __) =>
                  const SizedBox(width: 8),
              itemBuilder: (context, i) {
                final cat       = _categories[i];
                final isSelected = cat.id == _selectedCategory;
                return GestureDetector(
                  onTap: () =>
                      setState(() => _selectedCategory = cat.id),
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
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(cat.icon,
                            size: 14,
                            color: isSelected
                                ? Colors.white
                                : _kPrimary),
                        const SizedBox(width: 6),
                        Text(
                          cat.title,
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : _kTextDark,
                            fontWeight: isSelected
                                ? FontWeight.w700
                                : FontWeight.w600,
                            fontSize: 12.5,
                          ),
                        ),
                      ],
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
              '${_filtered.length} event${_filtered.length == 1 ? '' : 's'} found',
              style: const TextStyle(
                color: _kTextMuted,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          // ── Event List ────────────────────────────────────
          Expanded(
            child: _filtered.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.event_busy_rounded,
                            size: 56,
                            color: Colors.grey.shade300),
                        const SizedBox(height: 14),
                        Text(
                          'No events found',
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
                      final event = _filtered[i];
                      return _EventRow(
                        event: event,
                        onTap: () => _open(event),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

// ── Event Row Card ─────────────────────────────────────────────
class _EventRow extends StatelessWidget {
  final EventModel  event;
  final VoidCallback onTap;

  const _EventRow({required this.event, required this.onTap});

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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(18),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 16, vertical: 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Date badge
                Container(
                  width: 52,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        _kPrimary.withValues(alpha: 0.12),
                        _kSecondary.withValues(alpha: 0.06),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _dayPart(event.date),
                        style: const TextStyle(
                          color: _kPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          height: 1,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        _monthPart(event.date),
                        style: const TextStyle(
                          color: _kSecondary,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 14),

                // Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: _kPrimary
                                  .withValues(alpha: 0.08),
                              borderRadius:
                                  BorderRadius.circular(8),
                            ),
                            child: Text(
                              event.category,
                              style: const TextStyle(
                                color: _kPrimary,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 3),
                            decoration: BoxDecoration(
                              color: event.price > 0
                                  ? const Color(0xFFF3EEFF)
                                  : const Color(0xFFEAF7EE),
                              borderRadius:
                                  BorderRadius.circular(8),
                            ),
                            child: Text(
                              event.price > 0
                                  ? '₹${event.price.toStringAsFixed(0)}'
                                  : 'FREE',
                              style: TextStyle(
                                color: event.price > 0
                                    ? _kPrimary
                                    : const Color(0xFF2E7D32),
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        event.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: _kTextDark,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined,
                              size: 13, color: _kTextMuted),
                          const SizedBox(width: 3),
                          Expanded(
                            child: Text(
                              event.venue,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: _kTextMuted,
                                  fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 3),
                      Row(
                        children: [
                          const Icon(Icons.access_time_rounded,
                              size: 13, color: _kTextMuted),
                          const SizedBox(width: 3),
                          Text(
                            event.time,
                            style: const TextStyle(
                                color: _kTextMuted, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.chevron_right_rounded,
                    color: _kTextMuted, size: 22),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _dayPart(String date) {
    final parts = date.split(' ');
    if (parts.isEmpty) return '–';
    return parts[0].split('-').first;
  }

  String _monthPart(String date) {
    final parts = date.split(' ');
    if (parts.length < 2) return '';
    return parts[1].substring(0, 3).toUpperCase();
  }
}
