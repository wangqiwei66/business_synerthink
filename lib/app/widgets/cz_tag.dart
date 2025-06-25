import 'package:flutter/material.dart';

enum TagLevel {
  normal, // 普通
  warning, // 警告
  danger, // 危险
  success // 成功
}

class CZTag extends StatelessWidget {
  final String text;
  final TagLevel level;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;

  const CZTag({
    Key? key,
    required this.text,
    this.level = TagLevel.normal,
    this.fontSize = 12.0,
    this.padding,
    this.borderRadius = 12.0,
  }) : super(key: key);

  Color _getBackgroundColor() {
    switch (level) {
      case TagLevel.normal:
        return const Color(0xFFE5E6EB);
      case TagLevel.warning:
        return const Color(0xFFFFF3E8);
      case TagLevel.danger:
        return const Color(0xFFFFECE8);
      case TagLevel.success:
        return const Color(0xFFE8FFEA);
    }
  }

  Color _getTextColor() {
    switch (level) {
      case TagLevel.normal:
        return const Color(0xFF86909C);
      case TagLevel.warning:
        return const Color(0xFFFF7D00);
      case TagLevel.danger:
        return const Color(0xFFFF4D4F);
      case TagLevel.success:
        return const Color(0xFF00B42A);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(borderRadius!),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: _getTextColor(),
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
