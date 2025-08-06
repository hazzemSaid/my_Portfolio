// widgets/sections/contact_section.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_icons.dart';
import '../../core/route/mangement_route.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildViewMoreButton(),
        const SizedBox(height: 64),
        _buildContactContent(),
        const SizedBox(height: 64),
        _buildFooter(),
      ],
    );
  }

  Widget _buildViewMoreButton() {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFFF006E),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          'View More Projects >',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildContactContent() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final isMobile = screenWidth < 768;

        if (isMobile) {
          return Column(
            children: [
              _buildLeftContent(),
              const SizedBox(height: 32),
              _buildContactForm(),
            ],
          );
        } else {
          return Row(
            children: [
              // Left Content
              Expanded(child: _buildLeftContent()),
              const SizedBox(width: 64),
              // Right Contact Form
              Expanded(child: _buildContactForm()),
            ],
          );
        }
      },
    );
  }

  Widget _buildLeftContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildContactHeader(),
        const SizedBox(height: 24),
        _buildContactDescription(),
        const SizedBox(height: 32),
        _buildExperienceList(),
        const SizedBox(height: 32),
        // _buildSocialIcons(),
      ],
    );
  }

  Widget _buildContactHeader() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final fontSize = screenWidth < 768
            ? 24.0
            : screenWidth < 1024
            ? 30.0
            : 36.0;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Get In Touch',
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
                    text: 'Let\'s Talk For your ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'Next Projects',
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

  Widget _buildContactDescription() {
    return const Text(
      'Discuss a project or just want to say hi? Connect with me via email or through a phone call.',
      style: TextStyle(color: Colors.grey, fontSize: 16, height: 1.6),
    );
  }

  Widget _buildExperienceList() {
    return Column(
      children: [
        _buildExperienceItem('2+ Years of Experience'),
        _buildExperienceItem('Software Engineer'),
        _buildExperienceItem('Cross-Platform Developer'),
        _buildExperienceItem('Backend Developer'),
        _buildExperienceItem('Problem Solver'),
      ],
    );
  }

  Widget _buildExperienceItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Color(0xFFFF006E), size: 20),
          const SizedBox(width: 12),
          Text(text, style: const TextStyle(color: Colors.grey, fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildSocialIcons() {
    return Row(
      children: [
        _buildSocialIcon(AppIcons.github),
        const SizedBox(width: 16),
        _buildSocialIcon(AppIcons.leetcode),
        const SizedBox(width: 16),
        _buildSocialIcon(AppIcons.flutter),
        const SizedBox(width: 16),
        _buildSocialIcon(AppIcons.figma),
      ],
    );
  }

  Widget _buildSocialIcon(String svgPath) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: SvgPicture.asset(
          svgPath,
          colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
        ),
      ),
    );
  }

  Widget _buildContactForm() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Send Message',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          _buildFormFields(),
          const SizedBox(height: 24),
          _buildSubmitButton(() {}),
        ],
      ),
    );
  }

  Widget _buildFormFields() {
    return Column(
      children: [
        _buildTextField('Full Name'),
        const SizedBox(height: 16),
        _buildTextField('Email Address'),
        const SizedBox(height: 16),
        _buildTextField('Phone Number'),
        const SizedBox(height: 16),
        _buildTextField('Subject'),
        const SizedBox(height: 16),
        _buildTextField('Message', maxLines: 4),
      ],
    );
  }

  Widget _buildTextField(String label, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey),
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFF006E)),
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }

  Widget _buildSubmitButton(void Function()? onTap) {
    return GestureDetector(
      onTap:
          onTap ??
          () {
            // Handle submit action
          },

      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFFF006E),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  'Send Message',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFFF006E),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.send, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_buildCopyright(), _buildFooterNavigation()],
        ),
      ),
    );
  }

  Widget _buildCopyright() {
    return RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'Copyright @2024, ',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          TextSpan(
            text: 'Hazem Said',
            style: TextStyle(
              color: Color(0xFFFF006E),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: '. All Rights Reserved',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterNavigation() {
    return Row(
      children: [
        _buildFooterNavButton('About', ManagementRoute.scrollToAbout),
        _buildFooterNavButton('Services', ManagementRoute.scrollToServices),
        _buildFooterNavButton('Resume', ManagementRoute.scrollToResume),
        _buildFooterNavButton('Skills', ManagementRoute.scrollToSkills),
        _buildFooterNavButton('Projects', ManagementRoute.scrollToProjects),
      ],
    );
  }

  Widget _buildFooterNavButton(String text, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text, style: const TextStyle(color: Colors.grey)),
    );
  }
}
