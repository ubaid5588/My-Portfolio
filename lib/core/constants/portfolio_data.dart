// import 'package:flutter/material.dart';
import '../../models/project.dart';
import '../../models/skill.dart';
import '../../models/experience.dart';
import '../../models/service.dart';
import '../../models/education.dart';
import 'app_colors.dart';

class PortfolioData {
  static const String name = "Muhammad Ubaid";
  static const String role = "Flutter Developer";
  static const String secondaryRole = "Flutter & SwiftUI Developer";
  static const String headline =
      "Building modern, responsive and user-focused mobile and web applications with Flutter, Dart and modern development technologies.";
  static const String bio =
      "I'm a Flutter Developer with hands-on experience building cross-platform mobile applications using Flutter and Dart. I enjoy creating responsive interfaces, integrating APIs and Firebase services, implementing local storage and building maintainable application architecture.";
  static const String email = "Muhammadubaid5588@gmail.com";
  static const String emailSubject = "Service Inquiry";
  static const String phone = "+92 340 6797227";
  static const String location = "Khyber Pakhtunkhwa, Pakistan";
  static const String githubUrl = "https://github.com/ubaid5588";
  static const String linkedinUrl =
      "https://www.linkedin.com/in/muhammad-ubaid-804992206";
  static const String resumePdfAssetPath = "assets/pdf/Muhammad_Ubaid_Resume.pdf";
  static const String resumePdfFileName = "Muhammad_Ubaid_Resume.pdf";

  static const List<String> navLinks = [
    "Home",
    "About",
    "Skills",
    "Experience",
    "Projects",
    "Contact",
  ];

  static const List<Map<String, String>> stats = [
    {"value": "01+", "label": "Years Experience"},
    {"value": "08+", "label": "Projects Built"},
    {"value": "10+", "label": "Technologies"},
    {"value": "100%", "label": "Passion"},
  ];

  static final List<SkillCategory> skillCategories = [
    const SkillCategory(
      title: "Mobile Dev",
      skills: [
        SkillItem(name: "Flutter", color: AppColors.accentBlue),
        SkillItem(name: "Dart", color: AppColors.accentCyan),
        SkillItem(name: "Swift", color: AppColors.accentRose),
        SkillItem(name: "SwiftUI", color: AppColors.accentCoral),
      ],
    ),
    const SkillCategory(
      title: "Backend & Services",
      skills: [
        SkillItem(name: "Firebase", color: AppColors.accentAmber),
        SkillItem(name: "Firestore", color: AppColors.accentAmber),
        SkillItem(name: "Firebase Auth", color: AppColors.accentAmber),
        SkillItem(name: "Cloud Storage", color: AppColors.accentViolet),
        SkillItem(name: "REST APIs", color: AppColors.accentBlue),
        SkillItem(name: "JSON", color: AppColors.accentCyan),
      ],
    ),
    const SkillCategory(
      title: "State Management",
      skills: [
        SkillItem(name: "Provider", color: AppColors.accentViolet),
        SkillItem(name: "BLoC", color: AppColors.accentBlue),
        SkillItem(name: "GetX", color: AppColors.accentCyan),
      ],
    ),
    const SkillCategory(
      title: "Local Storage",
      skills: [
        SkillItem(name: "Hive", color: AppColors.accentAmber),
        SkillItem(name: "Shared Preferences", color: AppColors.accentRose),
      ],
    ),
    const SkillCategory(
      title: "Tools",
      skills: [
        SkillItem(name: "Git", color: AppColors.accentRose),
        SkillItem(name: "GitHub", color: AppColors.accentGitHub),
        SkillItem(name: "VS Code", color: AppColors.accentBlue),
        SkillItem(name: "Xcode", color: AppColors.accentViolet),
      ],
    ),
    const SkillCategory(
      title: "Other",
      skills: [
        SkillItem(name: "Responsive UI", color: AppColors.accentCyan),
        SkillItem(name: "OOP", color: AppColors.accentBlue),
        SkillItem(name: "Async/Await", color: AppColors.accentViolet),
        SkillItem(name: "Streams", color: AppColors.accentRose),
        SkillItem(name: "Notifications", color: AppColors.accentAmber),
      ],
    ),
  ];

  static final List<Project> projects = [
    const Project(
      id: "01",
      title: "PDF Reader",
      tech: ["Flutter", "Dart"],
      description:
          "A feature-rich PDF application with viewing, file handling, sharing, compression and image-based PDF functionality.",
      features: [
        "PDF Viewer",
        "Edit PDF",
        "Organize PDF",
        "Protect PDF",
        "Compress PDF",
        "PDF from Images",
        "File Sharing",
      ],
      color: AppColors.accentBlue,
      imageUrl:
          "https://images.unsplash.com/photo-1586281380349-632531db7ed4?w=800&h=600&fit=crop&auto=format",
    ),
    const Project(
      id: "02",
      title: "Music Player",
      tech: ["Flutter", "Firebase", "BLoC"],
      description:
          "A modern music player with authentication, playlists, artist browsing and complete playback controls.",
      features: [
        "Play/Pause/Seek",
        "Shuffle & Repeat",
        "Explore",
        "Playlists",
        "Artists",
        "Google Sign-In",
      ],
      color: AppColors.accentViolet,
      imageUrl:
          "https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?w=800&h=600&fit=crop&auto=format",
    ),
    const Project(
      id: "03",
      title: "Expense Tracker",
      tech: ["SwiftUI", "Swift"],
      description:
          "An iOS expense tracking app focused on simple management, categorization, data persistence and analytics.",
      features: [
        "Add Expenses",
        "Categories",
        "Analytics Charts",
        "Data Persistence",
        "Budget Tracking",
      ],
      color: AppColors.accentRose,
      imageUrl:
          "https://images.unsplash.com/photo-1554224155-8d04cb21cd6c?w=800&h=600&fit=crop&auto=format",
    ),
    const Project(
      id: "04",
      title: "Pantry Plus",
      tech: ["Flutter", "Firebase"],
      description:
          "A complete cross-platform grocery shopping app for Android and iOS with admin panel.",
      features: [
        "Authentication",
        "Product Browsing",
        "Cart Management",
        "Order Placement",
        "Admin Panel",
        "Firestore",
      ],
      color: AppColors.accentCyan,
      imageUrl:
          "https://images.unsplash.com/photo-1542838132-92c53300491e?w=800&h=600&fit=crop&auto=format",
    ),
    const Project(
      id: "05",
      title: "Weather App",
      tech: ["Flutter", "REST API", "JSON"],
      description:
          "A weather application retrieving live data using REST APIs and JSON parsing with clean UI.",
      features: [
        "Live Weather",
        "Location-based",
        "Forecasts",
        "JSON Parsing",
        "REST Integration",
      ],
      color: AppColors.accentAmber,
      imageUrl:
          "https://images.unsplash.com/photo-1504608524841-42584120d693?w=800&h=600&fit=crop&auto=format",
    ),
    const Project(
      id: "06",
      title: "Todo App",
      tech: ["Flutter", "GetX", "Hive"],
      description:
          "A local Todo application using Hive for persistence and GetX for reactive state management.",
      features: [
        "Create Tasks",
        "Categories",
        "Hive Persistence",
        "GetX Reactive",
        "Mark Complete",
      ],
      color: AppColors.accentCoral,
      imageUrl:
          "https://images.unsplash.com/photo-1484480974693-6ca0a78fb36b?w=800&h=600&fit=crop&auto=format",
    ),
  ];

  static const List<ExperienceItem> experiences = [
    ExperienceItem(
      role: "Flutter Developer Intern",
      company: "Khasologix Software House",
      period: "March 2026 – Present",
      badge: "Current",
      description:
          "Contributing to Rently, a car rental mobile application, with a focus on modern, responsive and user-friendly Flutter interfaces.",
      highlights: [
        "Rently – Car Rental App",
        "Responsive Flutter UI",
        "Reusable widgets",
        "Git/GitHub workflow",
      ],
    ),
    ExperienceItem(
      role: "Personal Projects",
      company: "Self-Directed",
      period: "2023 – 2026",
      badge: "Portfolio",
      description:
          "Built a range of mobile apps using Flutter, Dart, Firebase, REST APIs, SwiftUI and various state management patterns.",
      highlights: [
        "Weather App (REST API)",
        "Todo App (Hive + GetX)",
        "Music Player (Firebase + BLoC)",
        "PDF Reader",
        "Expense Tracker (SwiftUI)",
      ],
    ),
  ];

  static const List<EducationItem> education = [
    EducationItem(
      degree: "Bachelor of Computer Science",
      institution: "Abdul Wali Khan University Mardan",
      period: "2021 – 2025",
    ),
    EducationItem(
      degree: "F.Cs",
      institution: "Government Post Graduate College Mardan",
      period: "2019 – 2021",
    ),
  ];

  static const List<ServiceItem> services = [
    ServiceItem(
      icon: "📱",
      title: "Flutter Mobile Apps",
      description: "Cross-platform Android and iOS applications.",
    ),
    ServiceItem(
      icon: "🌐",
      title: "Flutter Web",
      description: "Responsive web applications and developer portfolios.",
    ),
    ServiceItem(
      icon: "🔥",
      title: "Firebase Integration",
      description: "Auth, Firestore, Cloud Storage and backend services.",
    ),
    ServiceItem(
      icon: "🔗",
      title: "REST API Integration",
      description: "API integration, JSON parsing and dynamic data.",
    ),
    ServiceItem(
      icon: "🎨",
      title: "UI Development",
      description: "Modern, responsive and reusable Flutter interfaces.",
    ),
    ServiceItem(
      icon: "🍎",
      title: "SwiftUI Apps",
      description: "Modern native iOS interfaces using SwiftUI.",
    ),
  ];

  static const List<Map<String, String>> philosophies = [
    {
      "icon": "✦",
      "title": "Clean UI",
      "desc": "Simple and intuitive user experiences above all.",
    },
    {
      "icon": "⬡",
      "title": "Reusable Architecture",
      "desc": "Components and structures built to last.",
    },
    {
      "icon": "◈",
      "title": "Responsive Design",
      "desc": "Interfaces that adapt across every screen size.",
    },
    {
      "icon": "∞",
      "title": "Continuous Learning",
      "desc": "Always exploring Flutter, SwiftUI and beyond.",
    },
  ];
}
