// widgets/sections/resume_section.dart
import 'package:flutter/material.dart';

class ResumeSection extends StatelessWidget {
  const ResumeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_buildHeader(), const SizedBox(height: 64), _buildTimeline()],
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
        final subtitleFontSize = screenWidth < 768 ? 18.0 : 24.0;

        return Column(
          children: [
            Text(
              'My Resume',
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Practical ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: subtitleFontSize,
                    ),
                  ),
                  TextSpan(
                    text: 'Mobile & Backend Dev ',
                    style: TextStyle(
                      color: Color(0xFFFF006E),
                      fontSize: subtitleFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'Experience',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: subtitleFontSize,
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

  Widget _buildTimeline() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final isMobile = screenWidth < 768;

        if (isMobile) {
          return Column(
            children: [
              _buildEducationColumn(),
              const SizedBox(height: 32),
              _buildExperienceColumn(),
            ],
          );
        } else {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildEducationColumn()),
              _buildCenterLine(),
              Expanded(child: _buildExperienceColumn()),
            ],
          );
        }
      },
    );
  }

  Widget _buildEducationColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Education',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 32),
        _buildTimelineItem(
          'Faculty of Computers and Information, Suez Canal University',
          'Bachelor of Computer Science',
          '2022 - 2026 (Expected) | Current GPA: 3.1',
          'Studying core subjects including data structures, algorithms, operating systems, and software engineering. Currently focusing on mobile and backend development.',
        ),

        _buildTimelineItem(
          'Information Technology Institute (ITI)',
          'Mobile App Development Track (Flutter)',
          '2024',
          'Completed “Sportify” as a graduation project. Gained deep practical experience with Flutter, Firebase, and clean code principles.',
        ),
        //Ministry of Communications and Information Technology (MCIT), Egypt 2024
        _buildTimelineItem(
          'Ministry of Communications and Information Technology (MCIT), Egypt',
          'Mobile App Development Course',
          '2024',
          'Completed a comprehensive course on Flutter development, focusing on building responsive and performant mobile applications.',
        ),
      ],
    );
  }

  Widget _buildExperienceColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Experience',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 32),
        _buildTimelineItem(
          'Auvnet',
          ' Software Engineer Intern',
          '2025 - Present',
          'Working on real-time mobile applications using Flutter and Node.js. Gained hands-on experience with Firebase, MongoDB, and RESTful APIs.',
        ),
        _buildTimelineItem(
          'Software Development ',
          'freelance at Upwork & khamsat',
          '2024 - Present',
          'Developing real-time mobile apps using Flutter with Firebase and custom Node.js backends. Implemented features like real-time chat, location tracking, push notifications, and MongoDB data modeling.',
        ),
      ],
    );
  }

  Widget _buildCenterLine() {
    return Container(
      width: 2,
      height: 600,
      color: const Color(0xFFFF006E),
      margin: const EdgeInsets.symmetric(horizontal: 32),
    );
  }

  Widget _buildTimelineItem(
    String company,
    String role,
    String period,
    String description,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            company,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            role,
            style: const TextStyle(
              color: Color(0xFFFF006E),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFFF006E).withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              period,
              style: const TextStyle(
                color: Color(0xFFFF006E),
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
