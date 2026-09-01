import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/portfolio_data.dart';
import '../../core/responsive/responsive_layout.dart';
import '../../core/utils/url_launcher_helper.dart';
import '../../models/project.dart';
import '../common/glass_container.dart';
import '../common/section_header.dart';

class ProjectsWidget extends StatefulWidget {
  const ProjectsWidget({super.key});

  @override
  State<ProjectsWidget> createState() => _ProjectsWidgetState();
}

class _ProjectsWidgetState extends State<ProjectsWidget> {
  int _activeProjectIndex = 0;

  void _prevProject() {
    setState(() {
      _activeProjectIndex =
          (_activeProjectIndex - 1 + PortfolioData.projects.length) %
          PortfolioData.projects.length;
    });
  }

  void _nextProject() {
    setState(() {
      _activeProjectIndex =
          (_activeProjectIndex + 1) % PortfolioData.projects.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final activeProject = PortfolioData.projects[_activeProjectIndex];

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 80,
        horizontal: AppConstants.contentPaddingHorizontal,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppConstants.maxContentWidth,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(title: "Featured Projects", subtitle: "WORK"),
              const SizedBox(height: 48),

              // Master-Detail Showcase
              if (isDesktop)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left: Project Tabs List
                    Expanded(flex: 4, child: _buildProjectTabsList(isDark)),
                    const SizedBox(width: 32),

                    // Right: Project Detail View
                    Expanded(
                      flex: 6,
                      child: _buildProjectDetailCard(activeProject, isDark),
                    ),
                  ],
                )
              else
                Column(
                  children: [
                    _buildProjectTabsList(isDark),
                    const SizedBox(height: 32),
                    _buildProjectDetailCard(activeProject, isDark),
                  ],
                ),

              const SizedBox(height: 96),

              // Services Subsection
              const SectionHeader(
                title: "What I Can Build",
                subtitle: "SERVICES",
              ),
              const SizedBox(height: 40),
              _buildServicesGrid(isDark),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectTabsList(bool isDark) {
    return Column(
      children: List.generate(PortfolioData.projects.length, (index) {
        final p = PortfolioData.projects[index];
        final isActive = index == _activeProjectIndex;

        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: InkWell(
            onTap: () {
              setState(() {
                _activeProjectIndex = index;
              });
            },
            borderRadius: BorderRadius.circular(18),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: isActive
                    ? (isDark
                          ? AppColors.accentBlue.withValues(alpha: 0.12)
                          : AppColors.accentBlue.withValues(alpha: 0.08))
                    : (isDark ? AppColors.darkGlassBg : AppColors.lightGlassBg),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: isActive
                      ? p.color.withValues(alpha: 0.5)
                      : (isDark
                            ? AppColors.darkGlassBorder
                            : AppColors.lightGlassBorder),
                  width: isActive ? 1.5 : 1.0,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: isActive
                          ? p.color.withValues(alpha: 0.2)
                          : (isDark
                                ? const Color(0x14FFFFFF)
                                : const Color(0x0A000000)),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: isActive
                            ? p.color.withValues(alpha: 0.4)
                            : Colors.transparent,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      p.id,
                      style: TextStyle(
                        fontFamily: AppConstants.fontMono,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: p.color,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          p.title,
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
                          p.tech.join(" · "),
                          style: TextStyle(
                            fontFamily: AppConstants.fontMono,
                            fontSize: 11,
                            color: isActive
                                ? p.color
                                : (isDark
                                      ? AppColors.darkTextMuted
                                      : AppColors.lightTextMuted),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isActive)
                    Text(
                      "→",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: p.color,
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildProjectDetailCard(Project project, bool isDark) {
    return Column(
      children: [
        GlassContainer(
          variant: GlassVariant.heavy,
          borderRadius: BorderRadius.circular(28),
          customBorderColor: project.color.withValues(alpha: 0.35),
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Header Area
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(28),
                    ),
                    child: Container(
                      height: 240,
                      width: double.infinity,
                      color: const Color(0xFF101020),
                      child: Image.network(
                        project.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: project.color.withValues(alpha: 0.15),
                          child: Center(
                            child: Icon(
                              Icons.phone_android_rounded,
                              size: 64,
                              color: project.color,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(28),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            isDark
                                ? const Color(0xE603030A)
                                : const Color(0xE6F8F9FF),
                          ],
                          stops: const [0.4, 1.0],
                        ),
                      ),
                    ),
                  ),
                  // Project Badge Pill
                  Positioned(
                    top: 16,
                    left: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: project.color.withValues(alpha: 0.25),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: project.color.withValues(alpha: 0.5),
                        ),
                      ),
                      child: Text(
                        "PROJECT ${project.id}",
                        style: TextStyle(
                          fontFamily: AppConstants.fontMono,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: project.color,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Content Area
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project.title,
                      style: TextStyle(
                        fontFamily: AppConstants.fontSans,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: isDark
                            ? AppColors.darkTextPrimary
                            : AppColors.lightTextPrimary,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Tech Chips
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: project.tech.map((t) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: project.color.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: project.color.withValues(alpha: 0.3),
                            ),
                          ),
                          child: Text(
                            t,
                            style: TextStyle(
                              fontFamily: AppConstants.fontMono,
                              fontSize: 11,
                              color: project.color,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),

                    Text(
                      project.description,
                      style: TextStyle(
                        fontFamily: AppConstants.fontSans,
                        fontSize: 14,
                        height: 1.6,
                        color: isDark
                            ? AppColors.darkTextSecondary
                            : AppColors.lightTextSecondary,
                      ),
                    ),
                    const SizedBox(height: 18),

                    // Features Grid
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: project.features.map((f) {
                        return GlassContainer(
                          variant: GlassVariant.subtle,
                          borderRadius: BorderRadius.circular(8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          child: Text(
                            "✓ $f",
                            style: TextStyle(
                              fontFamily: AppConstants.fontSans,
                              fontSize: 11,
                              color: isDark
                                  ? AppColors.darkTextMuted
                                  : AppColors.lightTextMuted,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 24),

                    // Buttons
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () => UrlLauncherHelper.launchUrl(
                              PortfolioData.githubUrl,
                            ),
                            borderRadius: BorderRadius.circular(14),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    project.color,
                                    project.color.withValues(alpha: 0.7),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(14),
                                boxShadow: [
                                  BoxShadow(
                                    color: project.color.withValues(alpha: 0.3),
                                    blurRadius: 16,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                "View Project →",
                                style: TextStyle(
                                  fontFamily: AppConstants.fontSans,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        InkWell(
                          onTap: () => UrlLauncherHelper.launchUrl(
                            PortfolioData.githubUrl,
                          ),
                          borderRadius: BorderRadius.circular(14),
                          child: GlassContainer(
                            borderRadius: BorderRadius.circular(14),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 12,
                            ),
                            child: Row(
                              children: [
                                const Text("⌥ ", style: TextStyle(fontSize: 14)),
                                Text(
                                  "GitHub",
                                  style: TextStyle(
                                    fontFamily: AppConstants.fontSans,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: isDark
                                        ? const Color(0xFFA0BFFF)
                                        : const Color(0xFF3A6FE0),
                                  ),
                                ),
                              ],
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
        const SizedBox(height: 16),

        // Slider Navigation Controls
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: _prevProject,
              borderRadius: BorderRadius.circular(12),
              child: GlassContainer(
                borderRadius: BorderRadius.circular(12),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Text(
                  "← Prev",
                  style: TextStyle(
                    fontFamily: AppConstants.fontSans,
                    fontSize: 13,
                    color: isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.lightTextSecondary,
                  ),
                ),
              ),
            ),
            Row(
              children: List.generate(PortfolioData.projects.length, (i) {
                final isCurrent = i == _activeProjectIndex;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: isCurrent ? 20 : 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: isCurrent
                        ? project.color
                        : (isDark
                              ? const Color(0x26FFFFFF)
                              : const Color(0x26000000)),
                    borderRadius: BorderRadius.circular(3),
                  ),
                );
              }),
            ),
            InkWell(
              onTap: _nextProject,
              borderRadius: BorderRadius.circular(12),
              child: GlassContainer(
                borderRadius: BorderRadius.circular(12),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Text(
                  "Next →",
                  style: TextStyle(
                    fontFamily: AppConstants.fontSans,
                    fontSize: 13,
                    color: isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.lightTextSecondary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildServicesGrid(bool isDark) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        int crossAxisCount = 3;
        if (width < 650) {
          crossAxisCount = 1;
        } else if (width < 1000) {
          crossAxisCount = 2;
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: PortfolioData.services.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            mainAxisExtent: 160,
          ),
          itemBuilder: (context, index) {
            final s = PortfolioData.services[index];
            return GlassContainer(
              borderRadius: BorderRadius.circular(22),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.accentBlue.withValues(alpha: 0.25),
                          AppColors.accentViolet.withValues(alpha: 0.15),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: AppColors.accentBlue.withValues(alpha: 0.25),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(s.icon, style: const TextStyle(fontSize: 22)),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    s.title,
                    style: TextStyle(
                      fontFamily: AppConstants.fontSans,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isDark
                          ? AppColors.darkTextPrimary
                          : AppColors.lightTextPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    s.description,
                    style: TextStyle(
                      fontFamily: AppConstants.fontSans,
                      fontSize: 11.5,
                      height: 1.4,
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
