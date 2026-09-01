import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/portfolio_data.dart';
import '../../core/responsive/responsive_layout.dart';
import '../../core/utils/file_download_helper.dart';
import '../common/glass_container.dart';
import '../common/gradient_text.dart';

class HeroWidget extends StatefulWidget {
  final VoidCallback onViewProjects;

  const HeroWidget({super.key, required this.onViewProjects});

  @override
  State<HeroWidget> createState() => _HeroWidgetState();
}

class _HeroWidgetState extends State<HeroWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _rotationController;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 24),
    )..repeat();
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.only(
        top: 120,
        bottom: 80,
        left: AppConstants.contentPaddingHorizontal,
        right: AppConstants.contentPaddingHorizontal,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppConstants.maxContentWidth,
          ),
          child: Column(
            children: [
              if (isDesktop)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 6,
                      child: _buildHeroLeftContent(context, isDark),
                    ),
                    const SizedBox(width: 48),
                    Expanded(
                      flex: 5,
                      child: _buildTechConstellation(context, isDark),
                    ),
                  ],
                )
              else
                Column(
                  children: [
                    _buildHeroLeftContent(context, isDark),
                    const SizedBox(height: 60),
                    _buildTechConstellation(context, isDark),
                  ],
                ),
              const SizedBox(height: 80),
              _buildStatsBar(context, isDark),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeroLeftContent(BuildContext context, bool isDark) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Status Pill
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkGlassBg : AppColors.lightGlassBg,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: AppColors.accentBlue.withValues(alpha: 0.3),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.accentCyan,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.accentCyan,
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                "Available for opportunities",
                style: TextStyle(
                  fontFamily: AppConstants.fontSans,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.accentCyan,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 28),

        // Headline
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontFamily: AppConstants.fontSans,
              fontSize: screenWidth < 600 ? 36 : (screenWidth < 1200 ? 48 : 64),
              fontWeight: FontWeight.w800,
              height: 1.05,
              letterSpacing: -1.5,
              color: isDark
                  ? AppColors.darkTextPrimary
                  : AppColors.lightTextPrimary,
            ),
            children: const [TextSpan(text: "Hi, I'm\n")],
          ),
        ),
        GradientText(
          "Muhammad",
          style: TextStyle(
            fontFamily: AppConstants.fontSans,
            fontSize: screenWidth < 600 ? 36 : (screenWidth < 1200 ? 48 : 64),
            fontWeight: FontWeight.w800,
            height: 1.05,
            letterSpacing: -1.5,
          ),
        ),
        GradientText(
          "Ubaid",
          style: TextStyle(
            fontFamily: AppConstants.fontSans,
            fontSize: screenWidth < 600 ? 36 : (screenWidth < 1200 ? 48 : 64),
            fontWeight: FontWeight.w800,
            height: 1.05,
            letterSpacing: -1.5,
          ),
        ),
        const SizedBox(height: 20),

        // Subtitle Divider
        Row(
          children: [
            Container(
              height: 1,
              width: 30,
              color: AppColors.accentBlue.withValues(alpha: 0.4),
            ),
            const SizedBox(width: 12),
            Text(
              PortfolioData.secondaryRole,
              style: TextStyle(
                fontFamily: AppConstants.fontMono,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isDark
                    ? const Color(0xFFA0BFFF)
                    : const Color(0xFF3A6FE0),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                height: 1,
                color: AppColors.accentBlue.withValues(alpha: 0.4),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),

        // Description
        Text(
          PortfolioData.headline,
          style: TextStyle(
            fontFamily: AppConstants.fontSans,
            fontSize: 16,
            height: 1.6,
            color: isDark
                ? AppColors.darkTextSecondary
                : AppColors.lightTextSecondary,
          ),
        ),
        const SizedBox(height: 36),

        // CTAs
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            // View Projects Button
            InkWell(
              onTap: widget.onViewProjects,
              borderRadius: BorderRadius.circular(16),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  gradient: AppColors.buttonGradient,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.accentBlue.withValues(alpha: 0.35),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: const Text(
                  "View My Projects →",
                  style: TextStyle(
                    fontFamily: AppConstants.fontSans,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            InkWell(
              onTap: () => FileDownloadHelper.downloadResume(),
              borderRadius: BorderRadius.circular(16),
              child: GlassContainer(
                borderRadius: BorderRadius.circular(16),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
                child: Text(
                  "↓ Download CV",
                  style: TextStyle(
                    fontFamily: AppConstants.fontSans,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isDark
                        ? const Color(0xFFC0CFFF)
                        : const Color(0xFF2A4AAF),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 36),

        // Social Links
        Row(
          children: [
            _buildSocialLink("GitHub", "⌥", isDark),
            const SizedBox(width: 24),
            _buildSocialLink("LinkedIn", "💼", isDark),
            const SizedBox(width: 24),
            _buildSocialLink("Email", "✉️", isDark),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialLink(String label, String icon, bool isDark) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(icon, style: const TextStyle(fontSize: 14)),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            fontFamily: AppConstants.fontSans,
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: isDark
                ? const Color(0xFFA0BFFF).withValues(alpha: 0.7)
                : const Color(0xFF3A6FE0).withValues(alpha: 0.8),
          ),
        ),
      ],
    );
  }

  Widget _buildTechConstellation(BuildContext context, bool isDark) {
    final satellites = [
      {
        "label": "Flutter",
        "icon": "🔵",
        "angle": 0.0,
        "r": 130.0,
        "color": AppColors.accentBlue,
      },
      {
        "label": "Dart",
        "icon": "🎯",
        "angle": 60.0,
        "r": 130.0,
        "color": AppColors.accentCyan,
      },
      {
        "label": "Swift",
        "icon": "🦅",
        "angle": 120.0,
        "r": 130.0,
        "color": AppColors.accentRose,
      },
      {
        "label": "Firebase",
        "icon": "🔥",
        "angle": 180.0,
        "r": 130.0,
        "color": AppColors.accentAmber,
      },
      {
        "label": "Git",
        "icon": "⎇",
        "angle": 240.0,
        "r": 130.0,
        "color": AppColors.accentCoral,
      },
      {
        "label": "SwiftUI",
        "icon": "◎",
        "angle": 300.0,
        "r": 130.0,
        "color": AppColors.accentViolet,
      },
      {
        "label": "BLoC",
        "icon": "⧫",
        "angle": 30.0,
        "r": 180.0,
        "color": AppColors.accentBlue,
      },
      {
        "label": "GetX",
        "icon": "◉",
        "angle": 150.0,
        "r": 180.0,
        "color": AppColors.accentCyan,
      },
      {
        "label": "Hive",
        "icon": "⬡",
        "angle": 270.0,
        "r": 180.0,
        "color": AppColors.accentAmber,
      },
    ];

    return SizedBox(
      height: 440,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Inner Orbit Line
            Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.accentBlue.withValues(alpha: 0.15),
                  width: 1,
                ),
              ),
            ),

            // Outer Orbit Line
            Container(
              width: 360,
              height: 360,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.accentViolet.withValues(alpha: 0.10),
                  width: 1,
                ),
              ),
            ),

            // Center Glowing Orb
            GlassContainer(
              width: 140,
              height: 140,
              borderRadius: BorderRadius.circular(70),
              variant: GlassVariant.heavy,
              customBackgroundColor: AppColors.accentBlue.withValues(
                alpha: 0.15,
              ),
              customBorderColor: AppColors.accentBlue.withValues(alpha: 0.35),
              child: const Center(
                child: Text(
                  "⬟",
                  style: TextStyle(fontSize: 48, color: AppColors.accentBlue),
                ),
              ),
            ),

            // Animated Orbiting Satellites
            AnimatedBuilder(
              animation: _rotationController,
              builder: (context, child) {
                final currentAngleOffset =
                    _rotationController.value * 2 * math.pi;

                return Stack(
                  alignment: Alignment.center,
                  children: satellites.map((sat) {
                    final baseAngle = (sat["angle"] as double) * math.pi / 180;
                    final totalAngle = baseAngle + currentAngleOffset;
                    final r = sat["r"] as double;
                    final color = sat["color"] as Color;
                    final label = sat["label"] as String;
                    final icon = sat["icon"] as String;

                    final x = math.cos(totalAngle) * r;
                    final y = math.sin(totalAngle) * r;

                    return Transform.translate(
                      offset: Offset(x, y),
                      child: GlassContainer(
                        width: 52,
                        height: 52,
                        borderRadius: BorderRadius.circular(14),
                        variant: GlassVariant.subtle,
                        customBorderColor: color.withValues(alpha: 0.35),
                        padding: EdgeInsets.zero,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(icon, style: const TextStyle(fontSize: 16)),
                            Text(
                              label,
                              style: TextStyle(
                                fontFamily: AppConstants.fontMono,
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                                color: color,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsBar(BuildContext context, bool isDark) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 650;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: PortfolioData.stats.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isMobile ? 2 : 4,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: isMobile ? 1.6 : 1.9,
          ),
          itemBuilder: (context, index) {
            final item = PortfolioData.stats[index];
            return GlassContainer(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              borderRadius: BorderRadius.circular(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GradientText(
                    item["value"]!,
                    style: const TextStyle(
                      fontFamily: AppConstants.fontSans,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item["label"]!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppConstants.fontSans,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: isDark
                          ? AppColors.darkTextMuted
                          : AppColors.lightTextMuted,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
