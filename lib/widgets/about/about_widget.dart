import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/portfolio_data.dart';
import '../../core/responsive/responsive_layout.dart';
import '../../core/utils/url_launcher_helper.dart';
import '../common/glass_container.dart';
import '../common/gradient_text.dart';
import '../common/section_header.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 80,
        horizontal: AppConstants.contentPaddingHorizontal,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppConstants.maxContentWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(
                title: "About Me",
                subtitle: "WHO I AM",
              ),
              const SizedBox(height: 48),
              if (isDesktop)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: _buildProfileCard(context, isDark),
                    ),
                    const SizedBox(width: 48),
                    Expanded(
                      flex: 6,
                      child: _buildBioAndPhilosophy(context, isDark),
                    ),
                  ],
                )
              else
                Column(
                  children: [
                    _buildProfileCard(context, isDark),
                    const SizedBox(height: 40),
                    _buildBioAndPhilosophy(context, isDark),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context, bool isDark) {
    return GlassContainer(
      variant: GlassVariant.heavy,
      borderRadius: BorderRadius.circular(28),
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          // Avatar Top Card Area
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.accentBlue.withValues(alpha: isDark ? 0.12 : 0.08),
                  AppColors.accentViolet.withValues(alpha: isDark ? 0.08 : 0.04),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
            ),
            child: Column(
              children: [
                // Avatar circle
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        AppColors.accentBlue.withValues(alpha: 0.35),
                        AppColors.accentViolet.withValues(alpha: 0.25),
                      ],
                    ),
                    border: Border.all(
                      color: AppColors.accentBlue.withValues(alpha: 0.45),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.accentBlue.withValues(alpha: 0.25),
                        blurRadius: 30,
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: const Text("👨‍💻", style: TextStyle(fontSize: 44)),
                ),
                const SizedBox(height: 16),
                Text(
                  PortfolioData.name,
                  style: TextStyle(
                    fontFamily: AppConstants.fontSans,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  PortfolioData.role,
                  style: TextStyle(
                    fontFamily: AppConstants.fontSans,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.accentBlue,
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildMiniBadge(
                      "⌥ GitHub",
                      isDark,
                      () => UrlLauncherHelper.launchUrl(PortfolioData.githubUrl),
                    ),
                    const SizedBox(width: 8),
                    _buildMiniBadge(
                      "✉️ Email",
                      isDark,
                      () => UrlLauncherHelper.launchEmail(
                        PortfolioData.email,
                        subject: PortfolioData.emailSubject,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Metadata List
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                _buildInfoRow("📍", PortfolioData.location, isDark, null),
                const SizedBox(height: 14),
                _buildInfoRow(
                  "📧",
                  PortfolioData.email,
                  isDark,
                  () => UrlLauncherHelper.launchEmail(
                    PortfolioData.email,
                    subject: PortfolioData.emailSubject,
                  ),
                ),
                const SizedBox(height: 14),
                _buildInfoRow(
                  "📞",
                  PortfolioData.phone,
                  isDark,
                  () => UrlLauncherHelper.launchPhone(PortfolioData.phone),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMiniBadge(String label, bool isDark, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: GlassContainer(
        variant: GlassVariant.subtle,
        borderRadius: BorderRadius.circular(10),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: AppConstants.fontSans,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: isDark ? const Color(0xFFA0BFFF) : const Color(0xFF3A6FE0),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    String icon,
    String text,
    bool isDark,
    VoidCallback? onTap,
  ) {
    final row = Row(
      children: [
        Text(icon, style: const TextStyle(fontSize: 14)),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: AppConstants.fontMono,
              fontSize: 12,
              color: isDark
                  ? AppColors.darkTextSecondary
                  : AppColors.lightTextSecondary,
            ),
          ),
        ),
      ],
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(6),
        child: row,
      );
    }
    return row;
  }

  Widget _buildBioAndPhilosophy(BuildContext context, bool isDark) {
    final quickTech = [
      {"name": "Flutter", "color": AppColors.accentBlue},
      {"name": "Dart", "color": AppColors.accentCyan},
      {"name": "Firebase", "color": AppColors.accentAmber},
      {"name": "REST APIs", "color": AppColors.accentBlue},
      {"name": "State Mgmt", "color": AppColors.accentViolet},
      {"name": "Local Storage", "color": AppColors.accentAmber},
      {"name": "Swift", "color": AppColors.accentRose},
      {"name": "SwiftUI", "color": AppColors.accentCoral},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          PortfolioData.bio,
          style: TextStyle(
            fontFamily: AppConstants.fontSans,
            fontSize: 16,
            height: 1.7,
            color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
          ),
        ),
        const SizedBox(height: 28),

        // Quick Tech Chips
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: quickTech.map((t) {
            final color = t["color"] as Color;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkGlassBg : AppColors.lightGlassBg,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: color.withValues(alpha: 0.3)),
              ),
              child: Text(
                t["name"] as String,
                style: TextStyle(
                  fontFamily: AppConstants.fontMono,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 36),

        // HOW I BUILD
        Text(
          "HOW I BUILD",
          style: TextStyle(
            fontFamily: AppConstants.fontMono,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted,
          ),
        ),
        const SizedBox(height: 16),

        // Philosophy Cards
        Column(
          children: PortfolioData.philosophies.map((p) {
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: GlassContainer(
                variant: GlassVariant.subtle,
                borderRadius: BorderRadius.circular(16),
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GradientText(
                      p["icon"]!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            p["title"]!,
                            style: TextStyle(
                              fontFamily: AppConstants.fontSans,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: isDark
                                  ? AppColors.darkTextPrimary
                                  : AppColors.lightTextPrimary,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            p["desc"]!,
                            style: TextStyle(
                              fontFamily: AppConstants.fontSans,
                              fontSize: 12,
                              color: isDark
                                  ? AppColors.darkTextMuted
                                  : AppColors.lightTextMuted,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
