import 'package:flutter/material.dart';

class ScalableWell extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double scaleFactor;
  final Duration duration;

  const ScalableWell({
    Key? key,
    required this.child,
    this.onTap,
    this.scaleFactor = 0.9,
    this.duration = const Duration(milliseconds: 300),
  }) : super(key: key);

  @override
  _ScalableWellState createState() => _ScalableWellState();
}

class _ScalableWellState extends State<ScalableWell> {
  bool _isPressed = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _isPressed = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _isPressed = false;
    });
    if (widget.onTap != null) {
      widget.onTap!();
    }
  }

  void _handleTapCancel() {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown, // 点击时触发缩放
      onTapUp: _handleTapUp, // 松开时恢复
      onTapCancel: _handleTapCancel, // 点击取消也恢复
      child: AnimatedScale(
        scale: _isPressed ? widget.scaleFactor : 1.0,
        duration: widget.duration,
        curve: Curves.easeInOut,
        child: widget.child,
      ),
    );
  }
}
