import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Displays a compact attendee count badge with a people icon.
/// Used by EventDetailScreen to show how many students are attending.
class AttendeeAvatarStack extends StatelessWidget {
  final String countText;
  final double avatarSize;

  const AttendeeAvatarStack({
    super.key,
    this.countText = '+11k',
    this.avatarSize = 22.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.primaryOrange.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.people_alt_rounded,
            size: 13,
            color: AppColors.primaryOrange,
          ),
          const SizedBox(width: 4),
          Text(
            countText,
            style: const TextStyle(
              color: AppColors.primaryOrange,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
