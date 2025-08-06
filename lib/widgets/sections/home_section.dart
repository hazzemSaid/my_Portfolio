// widgets/sections/home_section.dart
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constants/app_icons.dart';
import '../../core/utils/responsive_text.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;

    if (isMobile) {
      return _buildMobileLayout(context);
    } else if (isTablet) {
      return _buildTabletLayout(context);
    } else {
      return _buildDesktopLayout(context);
    }
  }

  Widget _buildMobileLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Profile Image (Top)
          Container(height: 300, child: _buildProfileImage(context)),
          // Content (Bottom)
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildGreeting(),
                const SizedBox(height: 16),
                _buildName(context),
                const SizedBox(height: 16),
                _buildTitle(),
                const SizedBox(height: 24),
                _buildDescription(),
                const SizedBox(height: 32),
                _buildActionButtons(context),
                const SizedBox(height: 32),
                _buildSocialIcons(context),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return Row(
      children: [
        // Left Content
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildGreeting(),
                const SizedBox(height: 16),
                _buildName(context),
                const SizedBox(height: 16),
                _buildTitle(),
                const SizedBox(height: 24),
                _buildDescription(),
                const SizedBox(height: 32),
                _buildActionButtons(context),
                const SizedBox(height: 32),
                _buildSocialIcons(context),
              ],
            ),
          ),
        ),
        // Right Image
        Expanded(flex: 1, child: _buildProfileImage(context)),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        // Left Content
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(64.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildGreeting(),
                const SizedBox(height: 16),
                _buildName(context),
                const SizedBox(height: 16),
                _buildTitle(),
                const SizedBox(height: 32),
                _buildDescription(),
                const SizedBox(height: 48),
                _buildActionButtons(context),
                const SizedBox(height: 48),
                _buildSocialIcons(context),
              ],
            ),
          ),
        ),
        // Right Image
        Expanded(flex: 1, child: _buildProfileImage(context)),
      ],
    );
  }

  Widget _buildGreeting() {
    return Builder(
      builder: (context) => Text(
        'HELLO, MY NAME IS',
        style: ResponsiveText.getResponsiveTextStyle(
          context,
          TextType.labelLarge,
          color: Colors.grey,
          customLetterSpacing: 2,
        ),
      ),
    );
  }

  Widget _buildName(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Hazem',
            style: ResponsiveText.getResponsiveTextStyle(
              context,
              TextType.displayMedium,
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'Said',
            style: ResponsiveText.getResponsiveTextStyle(
              context,
              TextType.displayMedium,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Builder(
      builder: (context) => Text(
        'Software Engineer',
        style: ResponsiveText.getResponsiveTextStyle(
          context,
          TextType.headlineMedium,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Builder(
      builder: (context) => Text(
        'Passionate about building impactful software, I craft elegant solutions for mobile, backend, and cross-platform systems. I thrive on turning ideas into reliable, scalable products—combining creativity, technical expertise, and strong problem-solving skills to tackle complex challenges.',
        style: ResponsiveText.getResponsiveTextStyle(
          context,
          TextType.bodyMedium,
          color: Colors.grey,
          customLineHeight: 1.6,
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    if (isMobile) {
      return Column(
        children: [
          _buildPrimaryButton(context, 'Download Resume'),
          const SizedBox(height: 16),
          _buildSecondaryButton(context, 'Contact Me'),
        ],
      );
    } else {
      return FittedBox(
        fit: BoxFit.scaleDown,

        child: Row(
          children: [
            _buildPrimaryButton(context, 'Download Resume'),
            const SizedBox(width: 16),
            _buildSecondaryButton(context, 'Contact Me'),
          ],
        ),
      );
    }
  }

  Widget _buildPrimaryButton(BuildContext context, String text) {
    return GestureDetector(
      onTap: () async {
        // Use url_launcher to open the Google Drive CV link
        const cvUrl =
            'https://drive.google.com/file/d/1ZcWsIOEGk8ONRVwL2yvI-ettf9gSnrtj/view';
        if (await canLaunchUrl(Uri.parse(cvUrl))) {
          await launchUrl(
            Uri.parse(cvUrl),
            mode: LaunchMode.externalApplication,
          );
        } else {
          //show dialog or log error
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Could not launch $cvUrl')));
        }
      },
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 1200),
          curve: Curves.elasticOut,
          builder: (context, value, child) {
            return Transform.scale(
              scale: value,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withOpacity(0.3 * value),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSecondaryButton(BuildContext context, String text) {
    return GestureDetector(
      onTap: () {
        final Uri emailLaunchUri = Uri(
          scheme: 'mailto',
          path: 'hazzemsaidd@gmail.com',
        );

        launchUrl(emailLaunchUri);
      },
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 1400),
          curve: Curves.elasticOut,
          builder: (context, value, child) {
            return Transform.scale(
              scale: value,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.2 * value),
                      blurRadius: 8,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSocialIcons(BuildContext context) {
    return Row(
      mainAxisAlignment: MediaQuery.of(context).size.width < 768
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,

      children: [
        _buildSocialIcon(
          AppIcons.github,
          Theme.of(context).colorScheme.surface,
          () async {
            const githubUrl = 'https://github.com/hazzemSaid';
            if (await canLaunchUrl(Uri.parse(githubUrl))) {
              await launchUrl(Uri.parse(githubUrl));
            }
          },
        ),

        const SizedBox(width: 16),
        _buildSocialIcon(
          AppIcons.linkedin,
          Theme.of(context).colorScheme.surface,
          () async {
            const linkedinUrl =
                'https://www.linkedin.com/in/hazem-said-775b66263/';
            if (await canLaunchUrl(Uri.parse(linkedinUrl))) {
              await launchUrl(Uri.parse(linkedinUrl));
            }
          },
        ),
        const SizedBox(width: 16),
        _buildSocialIcon(
          AppIcons.email,
          Theme.of(context).colorScheme.surface,
          () {
            final Uri emailLaunchUri = Uri(
              scheme: 'mailto',
              path: 'hazzemsaidd@gmail.com',
            );

            launchUrl(emailLaunchUri);
          },
        ),
      ],
    );
  }

  Widget _buildSocialIcon(String svgPath, Color color, void Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SvgPicture.asset(svgPath),
        ),
      ),
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;

    final containerSize = isMobile
        ? 250.0
        : isTablet
        ? 300.0
        : 400.0;
    final innerSize = isMobile
        ? 200.0
        : isTablet
        ? 250.0
        : 400.0;
    final iconSize = isMobile
        ? 40.0
        : isTablet
        ? 50.0
        : 60.0;
    final floatingDistance = isMobile
        ? 100.0
        : isTablet
        ? 150.0
        : 200.0;

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Animated background circles
          _buildAnimatedCircle(context, containerSize + 50, 0.0, 4.0),
          _buildAnimatedCircle(context, containerSize + 20, 1.0, 3.0),
          _buildAnimatedCircle(context, containerSize - 10, 2.0, 2.0),

          // Main profile container
          Container(
            width: containerSize,
            height: containerSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 4,
              ),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: _buildAnimatedProfileContent(context, innerSize),
          ),

          // Floating tech icons around the profile (only on desktop/tablet)
          //
        ],
      ),
    );
  }

  Widget _buildAnimatedCircle(
    BuildContext context,
    double size,
    double delay,
    double duration,
  ) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(seconds: duration.toInt()),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(
                  context,
                ).colorScheme.primary.withOpacity(0.1 * value),
                width: 2,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAnimatedProfileContent(BuildContext context, double size) {
    final iconSize = size * 0.57; // 200/350 ratio

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(seconds: 2),
      curve: Curves.elasticOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Theme.of(context).colorScheme.primary.withOpacity(0.4),
                  Theme.of(context).colorScheme.primary.withOpacity(0.2),
                  Colors.transparent,
                ],
              ),
            ),
            child: Center(
              child: Transform.rotate(
                angle: value * 2 * math.pi,
                child: ClipOval(
                  child: Container(
                    width: iconSize,
                    height: iconSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        width: 3,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        AppIcons.profileImage,
                        width: iconSize,
                        height: iconSize,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.person,
                            size: iconSize * 0.8,
                            color: Colors.white,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

//   Widget _buildFloatingIcon(
//     BuildContext context,
//     String svgPath,
//     double x,
//     double y,
//     double delay,
//     double iconSize,
//   ) {
//     return TweenAnimationBuilder<double>(
//       tween: Tween(begin: 0.0, end: 1.0),
//       duration: Duration(seconds: 2 + delay.toInt()),
//       curve: Curves.elasticOut,
//       builder: (context, value, child) {
//         return Positioned(
//           left: x * value,
//           top: y * value,
//           child: Transform.scale(
//             scale: value,
//             child: Container(
//               width: iconSize,
//               height: iconSize,
//               decoration: BoxDecoration(
//                 color: AppColors.cardBackground,
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: [
//                   BoxShadow(
//                     color: AppColors.primary.withOpacity(0.3),
//                     blurRadius: 10,
//                     spreadRadius: 2,
//                   ),
//                 ],
//               ),
//               child: Padding(
//                 padding: EdgeInsets.all(iconSize * 0.2),
//                 child: SvgPicture.asset(
//                   svgPath,
//                   colorFilter: ColorFilter.mode(
//                     AppColors.primary,
//                     BlendMode.srcIn,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
