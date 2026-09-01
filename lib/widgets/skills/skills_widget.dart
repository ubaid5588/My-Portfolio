import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/portfolio_data.dart';
import '../../models/skill.dart';
import '../common/glass_container.dart';
import '../common/section_header.dart';

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
                title: "Technologies I Work With",
                subtitle: "SKILLS",
              ),
              const SizedBox(height: 48),
              LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth;
                  int crossAxisCount = 3;
                  if (width < 700) {
                    crossAxisCount = 1;
                  } else if (width < 1050) {
                    crossAxisCount = 2;
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: PortfolioData.skillCategories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      mainAxisExtent: 180,
                    ),
                    itemBuilder: (context, index) {
                      final category = PortfolioData.skillCategories[index];
                      return _buildCategoryCard(category, isDark);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(SkillCategory category, bool isDark) {
    return GlassContainer(
      borderRadius: BorderRadius.circular(24),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category Title Row
          Row(
            children: [
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  gradient: AppColors.buttonGradient,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                category.title,
                style: TextStyle(
                  fontFamily: AppConstants.fontSans,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: isDark
                      ? AppColors.darkTextPrimary.withValues(alpha: 0.9)
                      : AppColors.lightTextPrimary.withValues(alpha: 0.9),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),

          // Skill Chips
          Expanded(
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: category.skills.map((skill) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.darkGlassSubtleBg : AppColors.lightGlassSubtleBg,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: skill.color.withValues(alpha: 0.25),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    skill.name,
                    style: TextStyle(
                      fontFamily: AppConstants.fontMono,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: skill.color,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
