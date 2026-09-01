import 'package:flutter/material.dart';

class Project {
  final String id;
  final String title;
  final List<String> tech;
  final String description;
  final List<String> features;
  final Color color;
  final String imageUrl;

  const Project({
    required this.id,
    required this.title,
    required this.tech,
    required this.description,
    required this.features,
    required this.color,
    required this.imageUrl,
  });
}
