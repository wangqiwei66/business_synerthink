import 'package:flutter/material.dart';
import 'package:tiny_weight/app/widgets/scalable.dart';

import '../config/color.dart';
import '../config/path.dart';

enum CzButtonStyle { primary, secondary }

class CzButton extends StatelessWidget {
  final CzButtonStyle style;
  final String text;
  final Function? ontap;
  final String? iconPath;
  final Icon? icon;
  final bool isEnable;
  final bool showloading;
  final double boderadius;
  final double fontSize;
  final double height;
  final double width;
  final MainAxisSize mainAxisSize;
  final bool elevated;
  final EdgeInsets? margin;
  final Color? bgColor;
  final Color? textColor;

  const CzButton({
    Key? key,
    this.style = CzButtonStyle.primary,
    this.text = '',
    this.ontap,
    this.iconPath,
    this.icon,
    this.isEnable = true,
    this.showloading = false,
    this.boderadius = 7,
    this.fontSize = 16,
    this.height = 40,
    this.width = 120,
    this.mainAxisSize = MainAxisSize.max,
    this.elevated = false,
    this.margin,
    this.bgColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isPrimary = style == CzButtonStyle.primary;
    final Color defaultBgColor =
        isPrimary ? const Color(0xFFCDFFA7) : Colors.white;
    const Color defaultTextColor = Color(0xff3e3e3e);
    final Border? border =
        isPrimary ? null : Border.all(color: Colors.grey, width: 1);

    return ScalableWell(
      onTap: () {
        if (ontap != null && isEnable && !showloading) {
          ontap!();
        }
      },
      child: Container(
        margin: margin,
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: isEnable ? (bgColor ?? defaultBgColor) : KColor.lineColor,
          borderRadius: BorderRadius.all(Radius.circular(boderadius)),
          border: border,
          boxShadow: elevated
              ? [
                  BoxShadow(
                    color: defaultBgColor.withOpacity(0.3),
                    spreadRadius: 0,
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: showloading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(defaultTextColor),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: mainAxisSize,
                children: [
                  if (icon != null)
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: icon,
                    ),
                  if (iconPath != null)
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Image.asset(
                        base_img_path + iconPath!,
                        width: 20,
                        height: 20,
                      ),
                    ),
                  Text(
                    text,
                    style: TextStyle(
                      color: isEnable
                          ? (textColor ?? defaultTextColor)
                          : const Color(0xffACACAC),
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
