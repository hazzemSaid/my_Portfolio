// widgets/sections/about_section.dart
import 'package:flutter/material.dart';

import '../../core/constants/app_icons.dart';
import '../../core/utils/responsive_text.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final isMobile = screenWidth < 768;

        if (isMobile) {
          return Column(
            children: [
              _buildProfileImage(),
              const SizedBox(height: 32),
              _buildContent(context),
            ],
          );
        } else {
          return Row(
            children: [
              // Left Image
              Expanded(flex: 1, child: _buildProfileImage()),
              const SizedBox(width: 64),
              // Right Content
              Expanded(flex: 1, child: _buildContent(context)),
            ],
          );
        }
      },
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: Container(
        width: 300,
        height: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[800],
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 15,
              spreadRadius: 2,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            AppIcons.profileImage,
            width: 300,
            height: 400,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Center(
                child: Icon(Icons.person, size: 150, color: Colors.grey),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(),
        const SizedBox(height: 16),
        _buildSubtitle(context),
        const SizedBox(height: 24),
        _buildDescription(),
        const SizedBox(height: 32),
        _buildSkillsList(),
      ],
    );
  }

  Widget _buildTitle() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final fontSize = screenWidth < 768
            ? 24.0
            : screenWidth < 1024
            ? 30.0
            : 36.0;

        return Text(
          'About Me',
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: 'Driven, ',
            style: TextStyle(
              color: Color(0xFFFF006E),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const TextSpan(
            text: 'innovative Software ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const TextSpan(
            text: 'Engineer',
            style: TextStyle(
              color: Color(0xFFFF006E),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Builder(
      builder: (context) => Text(
        'A passionate mobile app developer with strong experience in Flutter and Firebase, currently expanding backend skills using Node.js and MongoDB. Skilled in building real-time, scalable applications featuring location tracking, push notifications, and chat systems. Enthusiastic about clean code architecture, UI/UX best practices, and continuous learning. Actively engaged in solving data structures and algorithms problems on platforms like Codeforces and LeetCode. Strong project background with a proven ability to deliver robust solutions and collaborate effectively within teams.',
        style: ResponsiveText.getResponsiveTextStyle(
          context,
          TextType.bodyMedium,
          color: Colors.grey,
          customLineHeight: 1.6,
        ),
      ),
    );
  }

  Widget _buildSkillsList() {
    return Column(
      children: [
        _buildSkillItem(
          'developing cross-platform applications using Flutter and Dart',
        ),
        _buildSkillItem(
          'building scalable backend systems using Node.js and MongoDB',
        ),
        _buildSkillItem(
          'problem-solving and algorithmic thinking on platforms like Codeforces and LeetCode',
        ),
        _buildSkillItem(
          'Integration of payment services such as M-Pesa and PayPal',
        ),
      ],
    );
  }

  Widget _buildSkillItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Color(0xFFFF006E), size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Builder(
              builder: (context) => Text(
                text,
                style: ResponsiveText.getResponsiveTextStyle(
                  context,
                  TextType.bodyMedium,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
