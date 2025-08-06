// screens/portfolio_screen.dart
import 'package:flutter/material.dart';

import '../core/route/mangement_route.dart';
import '../core/utils/responsive_text.dart';
import '../widgets/sections/about_section.dart';
import '../widgets/sections/contact_section.dart';
import '../widgets/sections/home_section.dart';
import '../widgets/sections/projects_section.dart';
import '../widgets/sections/resume_section.dart';
import '../widgets/sections/services_section.dart';
import '../widgets/sections/skills_section.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  @override
  void dispose() {
    ManagementRoute.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevent keyboard overflow
      appBar: _buildAppBar(),
      body: SafeArea(
        // Add SafeArea for better mobile handling
        child: _buildBody(),
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: _buildAppBarTitle(),
      backgroundColor: Colors.transparent,
      actions: MediaQuery.of(context).size.width > 768
          ? _buildAppBarActions()
          : [_buildMobileMenuButton()],
    );
  }

  Widget _buildAppBarTitle() {
    final titleFontSize = ResponsiveText.getResponsiveFontSize(
      context,
      TextType.titleLarge,
    );

    return Row(
      children: [
        Text(
          'Hazem',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          ' Said',
          style: TextStyle(
            color: Colors.white,
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  List<Widget> _buildAppBarActions() {
    return [
      _buildNavButton('Home', ManagementRoute.scrollToHome),
      _buildNavButton('About', ManagementRoute.scrollToAbout),
      _buildNavButton('Services', ManagementRoute.scrollToServices),
      _buildNavButton('Resume', ManagementRoute.scrollToResume),
      _buildNavButton('Skills', ManagementRoute.scrollToSkills),
      _buildNavButton('Projects', ManagementRoute.scrollToProjects),
      _buildNavButton('Contact', ManagementRoute.scrollToContact),
      const SizedBox(width: 16),
      _buildHireMeButton(),
    ];
  }

  Widget _buildNavButton(String text, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }

  Widget _buildHireMeButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text(
        'Hire Me',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildMobileMenuButton() {
    return IconButton(
      icon: const Icon(Icons.menu, color: Colors.white),
      onPressed: () {
        _showMobileMenu(context);
      },
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1A1A1A),
      isScrollControlled: true, // Allow full control of height
      builder: (context) => SafeArea(
        child: Container(
          constraints: BoxConstraints(
            maxHeight:
                MediaQuery.of(context).size.height * 0.8, // Max 80% of screen
          ),
          child: SingleChildScrollView(
            // Add scrolling for overflow protection
            child: Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Handle bar for better UX
                  Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  _buildMobileNavItem('Home', ManagementRoute.scrollToHome),
                  _buildMobileNavItem('About', ManagementRoute.scrollToAbout),
                  _buildMobileNavItem(
                    'Services',
                    ManagementRoute.scrollToServices,
                  ),
                  _buildMobileNavItem('Resume', ManagementRoute.scrollToResume),
                  _buildMobileNavItem('Skills', ManagementRoute.scrollToSkills),
                  _buildMobileNavItem(
                    'Projects',
                    ManagementRoute.scrollToProjects,
                  ),
                  _buildMobileNavItem(
                    'Contact',
                    ManagementRoute.scrollToContact,
                  ),
                  const SizedBox(height: 16),
                  _buildHireMeButton(),
                  const SizedBox(height: 20), // Bottom padding for safe area
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileNavItem(String text, VoidCallback onPressed) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            Navigator.pop(context);
            onPressed();
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              text,
              style: ResponsiveText.getResponsiveTextStyle(
                context,
                TextType.titleMedium,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          controller: ManagementRoute.scrollController,
          child: Column(
            children: [
              // Home Section
              Container(
                key: ManagementRoute.homeKey,
                width: constraints.maxWidth, // Ensure full width
                padding: _getResponsivePadding(),
                child: const HomeSection(),
              ),

              // About Section
              Container(
                key: ManagementRoute.aboutKey,
                width: constraints.maxWidth,
                padding: _getResponsivePadding(),
                child: const AboutSection(),
              ),

              // Services Section
              Container(
                key: ManagementRoute.servicesKey,
                width: constraints.maxWidth,
                padding: _getResponsivePadding(),
                color: const Color(0xFF1A1A1A),
                child: const ServicesSection(),
              ),

              // Resume Section
              Container(
                key: ManagementRoute.resumeKey,
                width: constraints.maxWidth,
                padding: _getResponsivePadding(),
                child: const ResumeSection(),
              ),

              // Skills Section
              Container(
                key: ManagementRoute.skillsKey,
                width: constraints.maxWidth,
                padding: _getResponsivePadding(),
                color: const Color(0xFF1A1A1A),
                child: const SkillsSection(),
              ),

              // Projects Section
              Container(
                key: ManagementRoute.projectsKey,
                width: constraints.maxWidth,
                padding: _getResponsivePadding(),
                child: const ProjectsSection(),
              ),

              // Contact Section
              Container(
                key: ManagementRoute.contactKey,
                width: constraints.maxWidth,
                padding: _getResponsivePadding(),
                color: const Color(0xFF1A1A1A),
                child: const ContactSection(),
              ),
            ],
          ),
        );
      },
    );
  }

  EdgeInsets _getResponsivePadding() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    if (screenWidth < 768) {
      // Mobile: Smaller padding, consider screen height too
      final horizontalPadding = screenWidth * 0.05; // 5% of screen width
      final verticalPadding = screenHeight * 0.02; // 2% of screen height
      return EdgeInsets.symmetric(
        horizontal: horizontalPadding.clamp(16.0, 24.0), // Min 16, max 24
        vertical: verticalPadding.clamp(16.0, 24.0),
      );
    } else if (screenWidth < 1024) {
      // Tablet
      return const EdgeInsets.all(32.0);
    } else {
      // Desktop
      return const EdgeInsets.all(64.0);
    }
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () => ManagementRoute.scrollToTop(),
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: const Icon(Icons.arrow_upward, color: Colors.white),
    );
  }
}
