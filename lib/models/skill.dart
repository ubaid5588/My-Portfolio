import 'package:flutter/material.dart';

class SkillCategory {
  final String title;
  final List<SkillItem> skills;

  const SkillCategory({
    required this.title,
    required this.skills,
  });
}

class SkillItem {
  final String name;
  final Color color;

  const SkillItem({
    required this.name,
    required this.color,
  });
}
