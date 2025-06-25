import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tiny_weight/app/service/api_service.dart';

extension WidgetAnimation on Widget {
  Widget animationSlideYFadein() {
    return animate(delay: const Duration(milliseconds: 200))
        .slideY(
            begin: 0.2,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn)
        .fadeIn(
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  Widget animationSlideXFadein() {
    return animate(delay: const Duration(milliseconds: 200))
        .slideX(
            begin: 0.2,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn)
        .fadeIn(
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  Widget animationScaleXLeft() {
    return animate(delay: const Duration(milliseconds: 200)).scaleX(
      duration: 500.ms,
      curve: Curves.easeOut,
      alignment: Alignment.centerLeft, // 关键：设置缩放起点为左侧
    );
  }
}
