import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/portfolio_data.dart';
import '../../widgets/about/about_widget.dart';
import '../../widgets/common/background_blobs.dart';
import '../../widgets/common/glass_container.dart';
import '../../widgets/contact/contact_widget.dart';
import '../../widgets/experience/experience_widget.dart';
import '../../widgets/footer/footer_widget.dart';
import '../../widgets/hero/hero_widget.dart';
import '../../widgets/navbar/navbar_widget.dart';
import '../../widgets/projects/projects_widget.dart';
import '../../widgets/skills/skills_widget.dart';

class PortfolioScreen extends StatefulWidget {
  final VoidCallback onThemeToggle;
  final bool isDark;

  const PortfolioScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDark,
  });

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  bool _isScrolled = false;
  double _scrollProgress = 0.0;
  int _activeNavIndex = 0;
  bool _isMobileMenuOpen = false;

  late final List<GlobalKey> _sectionKeys;

  @override
  void initState() {
    super.initState();
    _sectionKeys = [
      _heroKey,
      _aboutKey,
      _skillsKey,
      _experienceKey,
      _projectsKey,
      _contactKey,
    ];
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final offset = _scrollController.offset;
    final maxScroll = _scrollController.position.maxScrollExtent;

    setState(() {
      _isScrolled = offset > 30;
      _scrollProgress = maxScroll > 0 ? (offset / maxScroll).clamp(0.0, 1.0) : 0.0;
    });
  }

  void _scrollToSection(int index) {
    if (index >= 0 && index < _sectionKeys.length) {
      final key = _sectionKeys[index];
      final context = key.currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 650),
          curve: Curves.easeInOutCubic,
        );
        setState(() {
          _activeNavIndex = index;
          _isMobileMenuOpen = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Blobs & Grid
          const BackgroundBlobs(),

          // Main Scrollable Content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                HeroWidget(
                  key: _heroKey,
                  onViewProjects: () => _scrollToSection(4),
                ),
                AboutWidget(key: _aboutKey),
                SkillsWidget(key: _skillsKey),
                ExperienceWidget(key: _experienceKey),
                ProjectsWidget(key: _projectsKey),
                ContactWidget(key: _contactKey),
                FooterWidget(onNavItemSelected: _scrollToSection),
              ],
            ),
          ),

          // Top Scroll Progress Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 2.5,
              child: Align(
                alignment: Alignment.centerLeft,
                child: FractionallySizedBox(
                  widthFactor: _scrollProgress,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: AppColors.primaryGradient,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Fixed Floating Navbar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavbarWidget(
              isScrolled: _isScrolled,
              activeIndex: _activeNavIndex,
              onNavItemSelected: _scrollToSection,
              onThemeToggle: widget.onThemeToggle,
              onMenuToggle: () {
                setState(() {
                  _isMobileMenuOpen = !_isMobileMenuOpen;
                });
              },
              isDark: widget.isDark,
            ),
          ),

          // Mobile Drawer Menu
          if (_isMobileMenuOpen)
            Positioned(
              top: 75,
              left: 16,
              right: 16,
              child: GlassContainer(
                variant: GlassVariant.heavy,
                borderRadius: BorderRadius.circular(20),
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    PortfolioData.navLinks.length,
                    (index) {
                      final title = PortfolioData.navLinks[index];
                      final isActive = _activeNavIndex == index;

                      return InkWell(
                        onTap: () => _scrollToSection(index),
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          child: Text(
                            title,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                              color: isActive
                                  ? AppColors.accentBlue
                                  : (widget.isDark
                                      ? AppColors.darkTextPrimary
                                      : AppColors.lightTextPrimary),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
