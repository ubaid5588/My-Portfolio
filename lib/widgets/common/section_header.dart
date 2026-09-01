import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextAlign textAlign;
  final CrossAxisAlignment crossAxisAlignment;

  const SectionHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.textAlign = TextAlign.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.accentViolet.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.accentViolet.withValues(alpha: 0.25),
            ),
          ),
          child: Text(
            subtitle.toUpperCase(),
            style: const TextStyle(
              fontFamily: AppConstants.fontMono,
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.accentViolet,
              letterSpacing: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          title,
          textAlign: textAlign,
          style: TextStyle(
            fontFamily: AppConstants.fontSans,
            fontSize: MediaQuery.sizeOf(context).width < 600 ? 28 : 40,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
            height: 1.15,
            color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
          ),
        ),
      ],
    );
  }
}
