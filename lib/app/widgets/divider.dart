// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class CzDivider extends StatelessWidget {
  final Color dividerColor;
  final EdgeInsets? margin;
  final double? width;
  final double? height;

  CzDivider({
    Key? key,
    this.margin = const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
    this.width,
    this.height = 1,
    this.dividerColor = const Color(0xFFE7E7E7),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? 1,
      color: dividerColor,
      margin: margin,
    );
  }
}
