import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/portfolio_data.dart';
import '../common/glass_container.dart';
import '../common/gradient_text.dart';

class FooterWidget extends StatelessWidget {
  final Function(int) onNavItemSelected;

  const FooterWidget({
    super.key,
    required this.onNavItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.only(
        top: 60,
        bottom: 40,
        left: AppConstants.contentPaddingHorizontal,
        right: AppConstants.contentPaddingHorizontal,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: isDark ? const Color(0x0FFFFFFF) : const Color(0x12000000),
            width: 1,
          ),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppConstants.maxContentWidth),
          child: Column(
            children: [
              // Top Footer Row
              LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = constraints.maxWidth < 750;

                  return isMobile
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildBrandCol(isDark),
                            const SizedBox(height: 24),
                            _buildNavLinks(isDark),
                            const SizedBox(height: 24),
                            _buildSocialBadges(isDark),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildBrandCol(isDark),
                            _buildNavLinks(isDark),
                            _buildSocialBadges(isDark),
                          ],
                        );
                },
              ),
              const SizedBox(height: 40),

              // Bottom Divider & Copyright
              Container(
                padding: const EdgeInsets.only(top: 24),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: isDark ? const Color(0x0AFFFFFF) : const Color(0x0F000000),
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "© 2026 Muhammad Ubaid. All rights reserved.",
                      style: TextStyle(
                        fontFamily: AppConstants.fontMono,
                        fontSize: 11,
                        color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted,
                      ),
                    ),
                    Text(
                      "Built with Flutter ❤️",
                      style: TextStyle(
                        fontFamily: AppConstants.fontMono,
                        fontSize: 11,
                        color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBrandCol(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GradientText(
          PortfolioData.name,
          style: TextStyle(
            fontFamily: AppConstants.fontSans,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          PortfolioData.role,
          style: TextStyle(
            fontFamily: AppConstants.fontMono,
            fontSize: 12,
            color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted,
          ),
        ),
      ],
    );
  }

  Widget _buildNavLinks(bool isDark) {
    return Wrap(
      spacing: 18,
      runSpacing: 10,
      children: List.generate(
        PortfolioData.navLinks.length,
        (i) => InkWell(
          onTap: () => onNavItemSelected(i),
          child: Text(
            PortfolioData.navLinks[i],
            style: TextStyle(
              fontFamily: AppConstants.fontSans,
              fontSize: 13,
              color: isDark
                  ? AppColors.darkTextSecondary.withValues(alpha: 0.7)
                  : AppColors.lightTextSecondary.withValues(alpha: 0.7),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialBadges(bool isDark) {
    final socials = ["GH", "LI", "✉"];
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: socials.map((s) {
        return Container(
          margin: const EdgeInsets.only(left: 8),
          child: GlassContainer(
            width: 36,
            height: 36,
            borderRadius: BorderRadius.circular(10),
            padding: EdgeInsets.zero,
            child: Center(
              child: Text(
                s,
                style: TextStyle(
                  fontFamily: AppConstants.fontSans,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
