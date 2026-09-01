import 'dart:ui';
import 'package:flutter/material.dart';

class BackgroundBlobs extends StatelessWidget {
  const BackgroundBlobs({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.sizeOf(context);

    return Positioned.fill(
      child: IgnorePointer(
        child: Stack(
          children: [
            // Top Left Blue/Violet Blob
            Positioned(
              top: -100,
              left: -100,
              child: Container(
                width: 650,
                height: 650,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFF5B8EFF).withValues(alpha: isDark ? 0.18 : 0.10),
                      const Color(0xFF9B6DFF).withValues(alpha: isDark ? 0.08 : 0.04),
                      Colors.transparent,
                    ],
                    stops: const [0.0, 0.6, 1.0],
                  ),
                ),
              ),
            ),

            // Middle Right Violet/Cyan Blob
            Positioned(
              top: size.height * 0.35,
              right: -100,
              child: Container(
                width: 550,
                height: 550,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFF9B6DFF).withValues(alpha: isDark ? 0.16 : 0.08),
                      const Color(0xFF4ECDC4).withValues(alpha: isDark ? 0.07 : 0.03),
                      Colors.transparent,
                    ],
                    stops: const [0.0, 0.6, 1.0],
                  ),
                ),
              ),
            ),

            // Bottom Left Cyan/Rose Blob
            Positioned(
              bottom: 100,
              left: size.width * 0.15,
              child: Container(
                width: 480,
                height: 480,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFF4ECDC4).withValues(alpha: isDark ? 0.12 : 0.06),
                      const Color(0xFFFF6B9D).withValues(alpha: isDark ? 0.06 : 0.02),
                      Colors.transparent,
                    ],
                    stops: const [0.0, 0.6, 1.0],
                  ),
                ),
              ),
            ),

            // Subtle 64px Grid Overlay
            CustomPaint(
              size: Size(size.width, size.height),
              painter: _GridPainter(isDark: isDark),
            ),
          ],
        ),
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  final bool isDark;
  _GridPainter({required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = (isDark ? Colors.white : Colors.black).withValues(alpha: isDark ? 0.018 : 0.025)
      ..strokeWidth = 1.0;

    const double step = 64.0;

    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _GridPainter oldDelegate) =>
      oldDelegate.isDark != isDark;
}
