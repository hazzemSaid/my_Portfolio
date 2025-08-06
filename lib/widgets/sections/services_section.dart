// widgets/sections/services_section.dart
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_icons.dart';
import '../../core/utils/responsive_text.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(),
        const SizedBox(height: 64),
        _buildServicesGrid(),
      ],
    );
  }

  Widget _buildHeader() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Text(
              'I like to make things easy and fun',
              style: ResponsiveText.getResponsiveTextStyle(
                context,
                TextType.bodyLarge,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'My ',
                    style: ResponsiveText.getResponsiveTextStyle(
                      context,
                      TextType.headlineLarge,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'Special Services ',
                    style: ResponsiveText.getResponsiveTextStyle(
                      context,
                      TextType.headlineLarge,
                      color: const Color(0xFFFF006E),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'For your ',
                    style: ResponsiveText.getResponsiveTextStyle(
                      context,
                      TextType.headlineLarge,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'Business Development',
                    style: ResponsiveText.getResponsiveTextStyle(
                      context,
                      TextType.headlineLarge,
                      color: const Color(0xFFFF006E),
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

  Widget _buildServicesGrid() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final crossAxisCount = screenWidth < 768
            ? 1
            : screenWidth < 1024
            ? 2
            : 3;
        final spacing = screenWidth < 768 ? 16.0 : 32.0;

        return GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing,
          childAspectRatio: screenWidth < 768 ? 1.1 : 1.0,
          children: [
            _buildServiceCard(
              'CROSS-PLATFORM DEVELOPMENT',
              AppIcons.flutter,
              'Build high-performance, beautiful apps for mobile, web, and desktop using Flutter and Dart.',
            ),

            _buildServiceCard(
              'Google maps',
              AppIcons.googleMaps,
              'Create intuitive interfaces and delightful user experiences by blending aesthetics with usability.',
            ),
            _buildServiceCard(
              'API DESIGN / INTEGRATION',
              AppIcons.nodejs,
              'Developing a highly secure, fast and scalable APIs both REST and GraphQL.',
            ),
            //storage firebase database
            _buildServiceCard(
              'Firebase Database',
              AppIcons.firebase,
              'Using Firebase for real-time data storage and synchronization and authentication.',
            ),
            //mongo db
            // _buildServiceCard(
            //   'MongoDB',
            //   AppIcons.mongodb,
            //   'Designing and implementing scalable, high-performance databases for modern applications.',
            // ),
            // _buildServiceCard(
            //   'Problem Solving',
            //   AppIcons.leetcode,
            //   'Strong analytical skills and a passion for tackling complex challenges through innovative solutions.',
            // ),
          ],
        );
      },
    );
  }

  Widget _buildServiceCard(String title, String svgPath, String description) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 1000),
      curve: Curves.elasticOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.2 * value),
                  blurRadius: 15,
                  spreadRadius: 3,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.rotate(
                  angle: value * 2 * math.pi,
                  child: SvgPicture.asset(svgPath, width: 48, height: 48),
                ),

                const SizedBox(height: 32),
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                    height: 1.4,
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
