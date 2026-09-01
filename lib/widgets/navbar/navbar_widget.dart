import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/portfolio_data.dart';
import '../../core/responsive/responsive_layout.dart';
import '../../core/utils/file_download_helper.dart';
import '../common/glass_container.dart';
import '../common/gradient_text.dart';

class NavbarWidget extends StatelessWidget {
  final bool isScrolled;
  final int activeIndex;
  final Function(int) onNavItemSelected;
  final VoidCallback onThemeToggle;
  final VoidCallback onMenuToggle;
  final bool isDark;

  const NavbarWidget({
    super.key,
    required this.isScrolled,
    required this.activeIndex,
    required this.onNavItemSelected,
    required this.onThemeToggle,
    required this.onMenuToggle,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: EdgeInsets.symmetric(
        vertical: isScrolled ? 12 : 20,
        horizontal: AppConstants.contentPaddingHorizontal,
      ),
      decoration: BoxDecoration(
        color: isScrolled
            ? (isDark ? const Color(0xB303030A) : const Color(0xB3F8F9FF))
            : Colors.transparent,
        border: Border(
          bottom: BorderSide(
            color: isScrolled
                ? (isDark ? const Color(0x14FFFFFF) : const Color(0x14000000))
                : Colors.transparent,
            width: 1,
          ),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppConstants.maxContentWidth,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo
              InkWell(
                onTap: () => onNavItemSelected(0),
                borderRadius: BorderRadius.circular(12),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.accentBlue.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.accentBlue.withValues(alpha: 0.3),
                          width: 1,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: const GradientText(
                        "MU",
                        style: TextStyle(
                          fontFamily: AppConstants.fontSans,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    if (MediaQuery.sizeOf(context).width > 480)
                      Text(
                        PortfolioData.name,
                        style: TextStyle(
                          fontFamily: AppConstants.fontSans,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: isDark
                              ? AppColors.darkTextPrimary.withValues(alpha: 0.8)
                              : AppColors.lightTextPrimary.withValues(
                                  alpha: 0.85,
                                ),
                        ),
                      ),
                  ],
                ),
              ),

              // Desktop Navigation Links
              if (isDesktop)
                Row(
                  children: List.generate(PortfolioData.navLinks.length, (
                    index,
                  ) {
                    final isActive = activeIndex == index;
                    final title = PortfolioData.navLinks[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: InkWell(
                        onTap: () => onNavItemSelected(index),
                        borderRadius: BorderRadius.circular(8),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                  fontFamily: AppConstants.fontSans,
                                  fontSize: 14,
                                  fontWeight: isActive
                                      ? FontWeight.w600
                                      : FontWeight.w500,
                                  color: isActive
                                      ? (isDark
                                            ? AppColors.darkTextPrimary
                                            : AppColors.lightTextPrimary)
                                      : (isDark
                                            ? AppColors.darkTextMuted
                                            : AppColors.lightTextMuted),
                                ),
                              ),
                              const SizedBox(height: 4),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: isActive ? 20 : 0,
                                height: 2,
                                decoration: BoxDecoration(
                                  gradient: AppColors.buttonGradient,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),

              // Actions (Theme toggle, GitHub, CV, Hamburger)
              Row(
                children: [
                  // Theme Toggle Button
                  InkWell(
                    onTap: onThemeToggle,
                    borderRadius: BorderRadius.circular(12),
                    child: GlassContainer(
                      width: 40,
                      height: 40,
                      borderRadius: BorderRadius.circular(12),
                      padding: EdgeInsets.zero,
                      child: Center(
                        child: Text(
                          isDark ? "☀️" : "🌙",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),

                  // GitHub Link Button
                  if (MediaQuery.sizeOf(context).width > 600)
                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(12),
                      child: GlassContainer(
                        width: 40,
                        height: 40,
                        borderRadius: BorderRadius.circular(12),
                        padding: EdgeInsets.zero,
                        child: Center(
                          child: Icon(
                            Icons.code_rounded,
                            size: 18,
                            color: isDark
                                ? AppColors.darkTextPrimary
                                : AppColors.lightTextPrimary,
                          ),
                        ),
                      ),
                    ),
                  if (MediaQuery.sizeOf(context).width > 600)
                    const SizedBox(width: 10),

                  // Download CV Button
                  if (isDesktop)
                    InkWell(
                      onTap: () => FileDownloadHelper.downloadResume(),
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 9,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.accentBlue.withValues(alpha: 0.25),
                              AppColors.accentViolet.withValues(alpha: 0.20),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppColors.accentBlue.withValues(alpha: 0.35),
                          ),
                        ),
                        child: const Row(
                          children: [
                            Text(
                              "↓ ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "CV",
                              style: TextStyle(
                                fontFamily: AppConstants.fontSans,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.accentBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  // Mobile Menu Button
                  if (!isDesktop)
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: InkWell(
                        onTap: onMenuToggle,
                        borderRadius: BorderRadius.circular(12),
                        child: GlassContainer(
                          width: 40,
                          height: 40,
                          borderRadius: BorderRadius.circular(12),
                          padding: EdgeInsets.zero,
                          child: Center(
                            child: Icon(
                              Icons.menu_rounded,
                              size: 20,
                              color: isDark
                                  ? AppColors.darkTextPrimary
                                  : AppColors.lightTextPrimary,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
