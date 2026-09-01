import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/portfolio_data.dart';
import '../common/glass_container.dart';
import '../common/gradient_text.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 90,
        horizontal: AppConstants.contentPaddingHorizontal,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            children: [
              // Eyebrow Pill
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                decoration: BoxDecoration(
                  color: AppColors.accentViolet.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.accentViolet.withValues(alpha: 0.25),
                  ),
                ),
                child: const Text(
                  "CONTACT",
                  style: TextStyle(
                    fontFamily: AppConstants.fontMono,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accentViolet,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 18),

              // Title
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: AppConstants.fontSans,
                    fontSize: screenWidth < 600 ? 30 : 44,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.5,
                    color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                  ),
                  children: const [
                    TextSpan(text: "Let's Build Something "),
                  ],
                ),
              ),
              GradientText(
                "Together",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: AppConstants.fontSans,
                  fontSize: screenWidth < 600 ? 30 : 44,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 12),

              Text(
                "Have an idea, project or opportunity? Let's talk.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: AppConstants.fontSans,
                  fontSize: 15,
                  color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted,
                ),
              ),
              const SizedBox(height: 48),

              // Main Contact Glass Container
              GlassContainer(
                variant: GlassVariant.heavy,
                borderRadius: BorderRadius.circular(28),
                padding: const EdgeInsets.all(32),
                customBorderColor: AppColors.accentBlue.withValues(alpha: 0.25),
                child: Column(
                  children: [
                    // Iridescent Top Accent Line
                    Container(
                      width: 180,
                      height: 3,
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 36),

                    // 3 Contact Channels
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final isMobile = constraints.maxWidth < 650;
                        return GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: isMobile ? 1 : 3,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: isMobile ? 3.0 : 1.35,
                          children: [
                            _buildChannelCard("📧", "Email", PortfolioData.email, isDark),
                            _buildChannelCard("📞", "Phone", PortfolioData.phone, isDark),
                            _buildChannelCard("📍", "Location", PortfolioData.location, isDark),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 36),

                    // Action Buttons
                    Wrap(
                      spacing: 14,
                      runSpacing: 14,
                      alignment: WrapAlignment.center,
                      children: [
                        // Primary Email CTA
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 14),
                          decoration: BoxDecoration(
                            gradient: AppColors.buttonGradient,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.accentBlue.withValues(alpha: 0.35),
                                blurRadius: 20,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("✉️  ", style: TextStyle(fontSize: 14)),
                              Text(
                                "Email Me",
                                style: TextStyle(
                                  fontFamily: AppConstants.fontSans,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // GitHub Button
                        GlassContainer(
                          borderRadius: BorderRadius.circular(16),
                          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text("⌥ ", style: TextStyle(fontSize: 14)),
                              Text(
                                "GitHub",
                                style: TextStyle(
                                  fontFamily: AppConstants.fontSans,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: isDark ? const Color(0xFFA0BFFF) : const Color(0xFF3A6FE0),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // LinkedIn Button
                        GlassContainer(
                          borderRadius: BorderRadius.circular(16),
                          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text("💼 ", style: TextStyle(fontSize: 14)),
                              Text(
                                "LinkedIn",
                                style: TextStyle(
                                  fontFamily: AppConstants.fontSans,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: isDark ? const Color(0xFFA0BFFF) : const Color(0xFF3A6FE0),
                                ),
                              ),
                            ],
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
      ),
    );
  }

  Widget _buildChannelCard(String icon, String label, String value, bool isDark) {
    return GlassContainer(
      variant: GlassVariant.subtle,
      borderRadius: BorderRadius.circular(18),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(icon, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontFamily: AppConstants.fontMono,
              fontSize: 11,
              color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: AppConstants.fontSans,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isDark
                  ? AppColors.darkTextPrimary.withValues(alpha: 0.85)
                  : AppColors.lightTextPrimary.withValues(alpha: 0.85),
            ),
          ),
        ],
      ),
    );
  }
}
