import 'package:flutter/material.dart';
import '../models/event_model.dart';
import '../Santoshi/registration_screen.dart';
import 'common_widgets.dart';


const _kPrimary   = Color(0xFF4A00E0);
const _kSecondary = Color(0xFF8E2DE2);
const _kTextDark  = Color(0xFF1A1A2E);
const _kTextMuted = Color(0xFF7A7A9D);
const _kScaffold  = Color(0xFFF7F7FB);
const _kHeartRed  = Color(0xFFE53935);

/// Member 4 — Detailed event view.
/// Hero banner with purple gradient, white bottom sheet, register CTA.
class MadhuriEventDetailScreen extends StatefulWidget {
  final EventModel event;

  const MadhuriEventDetailScreen({super.key, required this.event});

  @override
  State<MadhuriEventDetailScreen> createState() =>
      _MadhuriEventDetailScreenState();
}

class _MadhuriEventDetailScreenState
    extends State<MadhuriEventDetailScreen> {
  bool _isFavorite  = false;
  bool _isExpanded  = false;

  @override
  Widget build(BuildContext context) {
    final event = widget.event;
    final size  = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: Stack(
        children: [
          // ── Hero Banner with purple gradient ────────────────
          Positioned(
            top: 0, left: 0, right: 0,
            height: size.height * 0.46,
            child: Stack(
              children: [
                // Event image
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.network(
                    event.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [_kPrimary, _kSecondary],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          _categoryIcon(event.category),
                          color: Colors.white.withValues(alpha: 0.6),
                          size: 72,
                        ),
                      ),
                    ),
                  ),
                ),
                // Purple gradient overlay (matches Mrunali gradient style)
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        _kPrimary.withValues(alpha: 0.72),
                        Colors.transparent,
                        _kSecondary.withValues(alpha: 0.35),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                // Top bar
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        _circleBtn(
                          icon: Icons.arrow_back_ios_new_rounded,
                          onTap: () => Navigator.pop(context),
                        ),
                        _circleBtn(
                          icon: _isFavorite
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          iconColor:
                              _isFavorite ? _kHeartRed : Colors.white,
                          onTap: () => setState(
                              () => _isFavorite = !_isFavorite),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ── Sliding White Details Sheet ──────────────────────
          Positioned.fill(
            top: size.height * 0.40,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft:  Radius.circular(36),
                  topRight: Radius.circular(36),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 20,
                    offset: Offset(0, -6),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Drag handle
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(
                          top: 14, bottom: 8),
                      width: 46,
                      height: 4.5,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(
                          24, 12, 24, 100),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [

                          // ── Title + Price Tag ─────────────
                          Row(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  event.title,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w800,
                                    color: _kTextDark,
                                    letterSpacing: -0.4,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 8),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      _kPrimary,
                                      _kSecondary
                                    ],
                                  ),
                                  borderRadius:
                                      BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: _kPrimary
                                          .withValues(alpha: 0.35),
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Text(
                                  event.price > 0
                                      ? '₹${event.price.toStringAsFixed(0)}'
                                      : 'FREE',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),

                          // ── Attendee row ──────────────────
                          Row(
                            children: [
                              const Icon(
                                  Icons.people_alt_rounded,
                                  size: 15,
                                  color: _kPrimary),
                              const SizedBox(width: 6),
                              Text(
                                '${event.attendeeCount} students attending',
                                style: const TextStyle(
                                  color: _kTextMuted,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 8),
                              AttendeeAvatarStack(
                                countText:
                                    '+${event.attendeeCount}',
                              ),
                            ],
                          ),
                          const SizedBox(height: 22),

                          // ── Description ───────────────────
                          const Text(
                            'About the Event',
                            style: TextStyle(
                              color: _kTextDark,
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            event.description,
                            maxLines: _isExpanded ? null : 3,
                            overflow: _isExpanded
                                ? TextOverflow.visible
                                : TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: _kTextMuted,
                              fontSize: 13.5,
                              height: 1.55,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => setState(
                                () => _isExpanded = !_isExpanded),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 4),
                              child: Text(
                                _isExpanded
                                    ? 'Show less'
                                    : '...Read more',
                                style: const TextStyle(
                                  color: _kPrimary,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 22),

                          // ── Location tile ─────────────────
                          _buildDetailTile(
                            icon: Icons.location_on_rounded,
                            title: event.location,
                            subtitle: event.venue,
                          ),
                          const SizedBox(height: 12),

                          // ── Date & Time tile ──────────────
                          _buildDetailTile(
                            icon: Icons.calendar_month_rounded,
                            title: event.date,
                            subtitle: event.time,
                          ),
                          const SizedBox(height: 22),

                          // ── Popular badge ─────────────────
                          if (event.isPopular) ...[
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    _kPrimary.withValues(alpha: 0.10),
                                    _kSecondary
                                        .withValues(alpha: 0.04),
                                  ],
                                ),
                                borderRadius:
                                    BorderRadius.circular(16),
                                border: Border.all(
                                  color: _kPrimary
                                      .withValues(alpha: 0.2),
                                ),
                              ),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons
                                        .local_fire_department_rounded,
                                    color: _kPrimary,
                                    size: 18,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Popular Event · High Demand',
                                    style: TextStyle(
                                      color: _kPrimary,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 18),
                          ],

                          // ── Campus Venue Map ──────────────
                          const Text(
                            'Campus Venue Map',
                            style: TextStyle(
                              color: _kTextDark,
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 10),
                          _buildMapPreview(event.venue),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── Bottom CTA ──────────────────────────────────────
          Positioned(
            bottom: 20,
            left: 24,
            right: 24,
            child: SizedBox(
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => RegistrationScreen(
                        eventName: event.title,
                        eventType: event.eventType,
                        eventFee: event.price,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ).copyWith(
                  backgroundColor:
                      WidgetStateProperty.all(Colors.transparent),
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [_kPrimary, _kSecondary],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: _kPrimary.withValues(alpha: 0.45),
                        blurRadius: 16,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      event.price > 0
                          ? 'Buy Ticket  ₹${event.price.toStringAsFixed(0)}'
                          : 'Register Now — Free',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Helper: circle icon button ──────────────────────────────
  Widget _circleBtn({
    required IconData icon,
    Color iconColor = Colors.white,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.35),
          shape: BoxShape.circle,
          border: Border.all(
              color: Colors.white.withValues(alpha: 0.25), width: 1),
        ),
        child: Icon(icon, color: iconColor, size: 18),
      ),
    );
  }

  // ── Helper: info tile (location / date) ────────────────────
  Widget _buildDetailTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: _kScaffold,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: _kPrimary.withValues(alpha: 0.10),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: _kPrimary, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: _kTextMuted,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                      color: _kTextDark,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded,
              color: _kTextMuted, size: 22),
        ],
      ),
    );
  }

  // ── Helper: map preview placeholder ────────────────────────
  Widget _buildMapPreview(String venueName) {
    return Container(
      height: 110,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFEEEBFD),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
            color: _kPrimary.withValues(alpha: 0.15), width: 1.5),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 20,
            right: 20,
            child: Container(
              height: 6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [_kPrimary, _kSecondary],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 3))
                  ],
                ),
                child: const Icon(Icons.location_city_rounded,
                    color: Colors.white, size: 20),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 4)
                  ],
                ),
                child: Text(
                  venueName,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: _kTextDark,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── Helper: pick icon by category ──────────────────────────
  IconData _categoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'technology':
        return Icons.code_rounded;
      case 'music festival':
        return Icons.music_note_rounded;
      case 'sports':
        return Icons.sports_basketball_rounded;
      case 'festival arts':
        return Icons.palette_rounded;
      default:
        return Icons.celebration_rounded;
    }
  }
}
