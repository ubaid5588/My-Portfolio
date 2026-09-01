import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

enum GlassVariant { standard, heavy, subtle }

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final GlassVariant variant;
  final Color? customBorderColor;
  final Color? customBackgroundColor;
  final List<BoxShadow>? customShadows;

  const GlassContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.borderRadius,
    this.variant = GlassVariant.standard,
    this.customBorderColor,
    this.customBackgroundColor,
    this.customShadows,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final r = borderRadius ?? BorderRadius.circular(20);

    double blurSigma;
    Color bgColor;
    Color borderColor;
    List<BoxShadow> shadows;

    switch (variant) {
      case GlassVariant.heavy:
        blurSigma = 48.0;
        bgColor = customBackgroundColor ??
            (isDark ? AppColors.darkGlassHeavyBg : AppColors.lightGlassHeavyBg);
        borderColor = customBorderColor ??
            (isDark
                ? const Color(0x26FFFFFF)
                : const Color(0x1A000000));
        shadows = customShadows ??
            [
              BoxShadow(
                color: Colors.black.withValues(alpha: isDark ? 0.5 : 0.08),
                blurRadius: 64,
                offset: const Offset(0, 16),
              ),
            ];
        break;
      case GlassVariant.subtle:
        blurSigma = 12.0;
        bgColor = customBackgroundColor ??
            (isDark ? AppColors.darkGlassSubtleBg : AppColors.lightGlassSubtleBg);
        borderColor = customBorderColor ??
            (isDark
                ? const Color(0x12FFFFFF)
                : const Color(0x0D000000));
        shadows = customShadows ?? [];
        break;
      case GlassVariant.standard:
        blurSigma = 24.0;
        bgColor = customBackgroundColor ??
            (isDark ? AppColors.darkGlassBg : AppColors.lightGlassBg);
        borderColor = customBorderColor ??
            (isDark ? AppColors.darkGlassBorder : AppColors.lightGlassBorder);
        shadows = customShadows ??
            [
              BoxShadow(
                color: Colors.black.withValues(alpha: isDark ? 0.35 : 0.05),
                blurRadius: 32,
                offset: const Offset(0, 8),
              ),
            ];
        break;
    }

    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: r,
        boxShadow: shadows,
      ),
      child: ClipRRect(
        borderRadius: r,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: r,
              border: Border.all(color: borderColor, width: 1),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
