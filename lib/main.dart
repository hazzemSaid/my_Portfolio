// main.dart
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/portfolio_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hazem Said Portfolio',
      theme: ThemeData(
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFFFF006E), // Pink accent
          secondary: const Color(0xFFFF006E),
          surface: const Color(0xFF1A1A1A), // Dark background
          background: const Color(0xFF0A0A0A), // Very dark background
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.white,
          onBackground: Colors.white,
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.dmSansTextTheme(ThemeData.dark().textTheme),
        scaffoldBackgroundColor: const Color(0xFF0A0A0A),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1A1A1A),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: const AnimatedBackground(child: PortfolioScreen()),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AnimatedBackground extends StatefulWidget {
  final Widget child;

  const AnimatedBackground({super.key, required this.child});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(
        seconds: 10,
      ), // Reduced duration for more visible animation
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 2 * math.pi).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear, // Ensures smooth linear progression
      ),
    );

    // Start the repeating animation
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Animated background particles
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return SizedBox.expand(
              // Ensure full screen coverage
              child: CustomPaint(
                painter: BackgroundPainter(_animation.value),
                size: Size.infinite,
              ),
            );
          },
        ),
        // Main content
        widget.child,
      ],
    );
  }
}

class BackgroundPainter extends CustomPainter {
  final double animationValue;

  BackgroundPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    // Debug: Draw a simple moving circle to test if animation is working
    final testPaint = Paint()
      ..color = Colors.red.withOpacity(0.8)
      ..style = PaintingStyle.fill;

    // Simple test circle that moves across screen
    final testX = (animationValue / (2 * math.pi)) * size.width;
    canvas.drawCircle(Offset(testX, 50), 10, testPaint);

    final paint = Paint()
      ..color = const Color(0xFFFF006E)
          .withOpacity(0.5) // Much higher opacity for visibility
      ..style = PaintingStyle.fill;

    // Draw floating particles with more dynamic movement
    for (int i = 0; i < 20; i++) {
      // Reduced number for better performance
      final baseX = (i * 100.0) % size.width; // Ensure double values
      final baseY = (i * 80.0) % size.height;
      final radius = 5.0 + (i % 3); // Larger radius

      // More pronounced movement with different speeds for each particle
      final offsetX =
          math.sin(animationValue + i * 0.5) * 50; // Larger movement
      final offsetY = math.cos(animationValue + i * 0.5) * 50;

      // Ensure particles stay within bounds
      final x = (baseX + offsetX).clamp(0.0, size.width);
      final y = (baseY + offsetY).clamp(0.0, size.height);

      canvas.drawCircle(Offset(x, y), radius, paint);
    }

    // Remove connecting lines for now to simplify debugging
    // We'll add them back once particles are working

    // Debug info
    final textPainter = TextPainter(
      text: TextSpan(
        text: 'Animation: ${animationValue.toStringAsFixed(2)}',
        style: TextStyle(
          color: Colors.white,
          fontSize: size.width < 768 ? 12 : 16, // Responsive font size
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, const Offset(10, 10));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
