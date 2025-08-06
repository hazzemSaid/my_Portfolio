// widgets/sections/projects_section.dart
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/app_icons.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(),
        const SizedBox(height: 64),
        _buildProjectsGrid(),
      ],
    );
  }

  Widget _buildHeader() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final fontSize = screenWidth < 768
            ? 24.0
            : screenWidth < 1024
            ? 30.0
            : 36.0;

        return Column(
          children: [
            Text(
              'Latest Works',
              style: TextStyle(
                color: Colors.grey,
                fontSize: screenWidth < 768 ? 16 : 18,
              ),
            ),
            const SizedBox(height: 16),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Explore My Popular ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'Projects',
                    style: TextStyle(
                      color: Color(0xFFFF006E),
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildProjectsGrid() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;

        // Responsive grid configuration
        int crossAxisCount;
        double spacing;
        double childAspectRatio;
        print('Screen width: $screenWidth');

        if (screenWidth < 480) {
          // Extra small mobile - single column, compact spacing
          crossAxisCount = 1;
          spacing = 16.0;
          childAspectRatio =
              0.65; // Taller cards for mobile content, more image height
        } else if (screenWidth < 768) {
          // Mobile - single column, normal spacing
          crossAxisCount = 1;
          spacing = 16.0;
          childAspectRatio = 1.1; // More image height
        } else if (screenWidth < 1024) {
          // Tablet - two columns
          crossAxisCount = 2;
          spacing = 20.0;
          childAspectRatio = 0.8; // More image height
        } else if (screenWidth < 1440) {
          // Desktop - two columns with more spacing and less height
          crossAxisCount = 2;
          spacing = 24.0;
          childAspectRatio = 1.1; // More image height
        } else {
          // Large desktop - three columns
          crossAxisCount = 3;
          spacing = 28.0;
          childAspectRatio = 0.75; // More image height for three-column layout
        }

        return GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing,
          childAspectRatio: childAspectRatio,
          children: [
            _buildProjectCard(
              'Backend (Node.js)',
              'BULDM Backend',
              'A robust TypeScript/Express/MongoDB backend for lost and found item management, featuring AI-powered matching and real-time communication.',
              [AppIcons.darkbuldm],
            ),
            _buildProjectCard(
              'Mobile Application (iOS, Android)',
              'BULDM Frontend',
              'a cross-platform lost & found app with real-time features and AI integration.',

              [AppIcons.lightbuldmFront1],
            ),
            _buildProjectCard(
              "Mobile Application (iOS, Android)",
              'Quran App',
              " Quran App  The Quran App provides a unique experience for reading and listening to the Holy Quran, with advanced features that make it easy to interact with the Quran anytime and anywhere.",
              [AppIcons.quranApp],
            ),
            _buildProjectCard(
              "Mobile Application (iOS, Android)",
              'Sportify App',
              "Sportify is a mobile application developed as part of a final project for the Ministry of Communications and Information Technology. The app is designed to enhance user engagement in sports by providing real-time information, league standings, match updates, and personalized content in an intuitive and seamless interface.",
              [
                AppIcons.sportify,
                AppIcons.home,
                AppIcons.loginRegister,
                AppIcons.favTeam,
                AppIcons.profile,
                AppIcons.tableMatches,
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildProjectCard(
    String category,
    String title,
    String description,
    List<String> imagePaths,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final imageHeight = screenWidth < 768
            ? 300.0
            : screenWidth < 1024
            ? 260.0
            : 300.0; // Increased heights for better fit
        final padding = screenWidth < 768 ? 16.0 : 20.0;

        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFF2A2A2A),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Scrollable horizontal image list
              Container(
                height: imageHeight,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                    scrollbars: true,
                    dragDevices: {
                      PointerDeviceKind.touch,
                      PointerDeviceKind.mouse,
                    },
                  ),
                  child: Center(
                    child: Image.asset(imagePaths[0], fit: BoxFit.cover),
                  ),
                ),
              ),
              // Card body - use Expanded to fill remaining space
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildCategoryTag(category),
                      const SizedBox(height: 12),
                      _buildProjectTitle(title),
                      const SizedBox(height: 8),
                      Expanded(
                        child: Text(
                          description,
                          maxLines: 4, // Reduce max lines to prevent overflow
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            height: 1.4,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12), // Reduce bottom spacing
                      // _buildProjectFooter(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCategoryTag(String category) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFFF006E).withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        category,
        style: const TextStyle(
          color: Color(0xFFFF006E),
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildProjectTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildProjectFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'View Project',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Icon(Icons.arrow_forward, color: Color(0xFFFF006E), size: 20),
      ],
    );
  }
}
