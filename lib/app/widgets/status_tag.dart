import 'package:flutter/material.dart';
import 'package:tiny_weight/app/config/color.dart';

class StatusTag extends StatelessWidget {
  final String text;
  final StatusType type;
  final double? width;
  final double? height;
  final double? fontSize;

  const StatusTag({
    Key? key,
    required this.text,
    this.type = StatusType.primary,
    this.width,
    this.height,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StatusStyle style = _getStyleByType(type);

    return Container(
      width: width ?? 70,
      height: height ?? 24,
      decoration: BoxDecoration(
        color: style.bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: style.borderColor,
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: style.textColor,
            fontSize: fontSize ?? 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  StatusStyle _getStyleByType(StatusType type) {
    switch (type) {
      case StatusType.primary:
        return StatusStyle(
          bgColor: KColor.appbarColor.withOpacity(0.1),
          borderColor: KColor.appbarColor.withOpacity(0.2),
          textColor: KColor.appbarColor,
        );
      case StatusType.success:
        return StatusStyle(
          bgColor: Colors.green.withOpacity(0.1),
          borderColor: Colors.green.withOpacity(0.2),
          textColor: Colors.green,
        );
      case StatusType.warning:
        return StatusStyle(
          bgColor: Colors.orange.withOpacity(0.1),
          borderColor: Colors.orange.withOpacity(0.2),
          textColor: Colors.orange,
        );
      case StatusType.error:
        return StatusStyle(
          bgColor: Colors.red.withOpacity(0.1),
          borderColor: Colors.red.withOpacity(0.2),
          textColor: Colors.red,
        );
      case StatusType.info:
        return StatusStyle(
          bgColor: Colors.blue.withOpacity(0.1),
          borderColor: Colors.blue.withOpacity(0.2),
          textColor: Colors.blue,
        );
      case StatusType.gray:
        return StatusStyle(
          bgColor: Colors.grey.withOpacity(0.1),
          borderColor: Colors.grey.withOpacity(0.2),
          textColor: Colors.grey,
        );
    }
  }
}

enum StatusType {
  primary, // 主要
  success, // 成功
  warning, // 警告
  error, // 错误
  info, // 信息
  gray, // 灰色
}

class StatusStyle {
  final Color bgColor;
  final Color borderColor;
  final Color textColor;

  StatusStyle({
    required this.bgColor,
    required this.borderColor,
    required this.textColor,
  });
}
