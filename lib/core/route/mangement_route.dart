// core/route/mangement_route.dart
import 'package:flutter/material.dart';

class ManagementRoute {
  // Section keys for scroll navigation
  static final GlobalKey homeKey = GlobalKey();
  static final GlobalKey aboutKey = GlobalKey();
  static final GlobalKey servicesKey = GlobalKey();
  static final GlobalKey resumeKey = GlobalKey();
  static final GlobalKey skillsKey = GlobalKey();
  static final GlobalKey projectsKey = GlobalKey();
  static final GlobalKey experienceKey = GlobalKey();
  static final GlobalKey contactKey = GlobalKey();
  static final GlobalKey blogKey = GlobalKey();

  // Scroll controller
  static final ScrollController scrollController = ScrollController();

  // Navigation methods for smooth scrolling
  static void scrollToHome() {
    _scrollToSection(homeKey);
  }

  static void scrollToAbout() {
    _scrollToSection(aboutKey);
  }

  static void scrollToServices() {
    _scrollToSection(servicesKey);
  }

  static void scrollToResume() {
    _scrollToSection(resumeKey);
  }

  static void scrollToSkills() {
    _scrollToSection(skillsKey);
  }

  static void scrollToProjects() {
    _scrollToSection(projectsKey);
  }

  static void scrollToExperience() {
    _scrollToSection(experienceKey);
  }

  static void scrollToContact() {
    _scrollToSection(contactKey);
  }

  static void scrollToBlog() {
    _scrollToSection(blogKey);
  }

  // Helper method to scroll to a specific section
  static void _scrollToSection(GlobalKey key) {
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
        alignment: 0.0, // Align to top of viewport
      );
    }
  }

  // Check if a section is currently visible
  static bool isSectionVisible(GlobalKey key) {
    if (key.currentContext == null) return false;

    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);

    return position.dy >= 0 &&
        position.dy <= MediaQuery.of(key.currentContext!).size.height;
  }

  // Get current visible section
  static String getCurrentVisibleSection() {
    if (isSectionVisible(homeKey)) return 'home';
    if (isSectionVisible(aboutKey)) return 'about';
    if (isSectionVisible(servicesKey)) return 'services';
    if (isSectionVisible(resumeKey)) return 'resume';
    if (isSectionVisible(skillsKey)) return 'skills';
    if (isSectionVisible(projectsKey)) return 'projects';
    if (isSectionVisible(experienceKey)) return 'experience';
    if (isSectionVisible(contactKey)) return 'contact';
    if (isSectionVisible(blogKey)) return 'blog';
    return 'home';
  }

  // Scroll to top of page
  static void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  // Dispose scroll controller
  static void dispose() {
    scrollController.dispose();
  }
}
