// widgets/sections/skills_section.dart
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_icons.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(),
        const SizedBox(height: 64),
        _buildSkillsGrid(),
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
              'My Talent',
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
                    text: 'Professional ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'Skills',
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

  Widget _buildSkillsGrid() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final crossAxisCount = screenWidth < 768
            ? 2
            : screenWidth < 1024
            ? 3
            : 5;
        final spacing = screenWidth < 768 ? 16.0 : 24.0;

        return GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing,
          childAspectRatio: screenWidth < 768 ? 1.2 : 1.0,
          children: [
            _buildSkillItem(
              'Javascript',
              AppIcons.javascript,
              AppColors.javascript,
            ),
            _buildSkillItem(
              'Typescript',
              AppIcons.typescript,
              AppColors.typescript,
            ),
            _buildSkillItem('Figma', AppIcons.figma, AppColors.figma),
            _buildSkillItem('Node.js', AppIcons.nodejs, AppColors.react),
            _buildSkillItem('Express', AppIcons.express, AppColors.javascript),
            _buildSkillItem('MySQL', AppIcons.mysql, AppColors.typescript),
            _buildSkillItem('MongoDB', AppIcons.mongodb, AppColors.python),
            _buildSkillItem('Firebase', AppIcons.firebase, AppColors.php),
            _buildSkillItem('Flutter', AppIcons.flutter, AppColors.flutter),
            _buildSkillItem('Cpp', AppIcons.c, AppColors.c),
            _buildSkillItem('Git', AppIcons.github, AppColors.github),
            _buildSkillItem('Docker', AppIcons.docker, AppColors.docker),
            //Software Architecture
            // : RESTful API Development, Database Integration (MongoDB, Firebase), Server-Side Logic, Express.js Middleware, Firebase Cloud Functions
            _buildSkillItem('Postman', AppIcons.postman, AppColors.postman),
          ],
        );
      },
    );
  }

  Widget _buildSkillItem(String name, String svgPath, Color color) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 800),
      curve: Curves.elasticOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.withOpacity(0.3)),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.2 * value),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.rotate(
                  angle: value * 2 * math.pi,
                  child: SvgPicture.asset(svgPath, width: 46, height: 46),
                ),
                const SizedBox(height: 8),
                Text(
                  name,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
