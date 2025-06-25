// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiny_weight/app/config/color.dart';
import 'package:tiny_weight/app/config/font.dart';
import 'package:tiny_weight/app/widgets/scalable.dart';

class CzSelectDate extends StatelessWidget {
  final String? title;
  final String? value;
  final Widget? subWidget;
  final bool isRequired;
  final Function? ontap;
  final EdgeInsets? padding;
  final bool? showRight;
  final Widget? leftWidget;
  final Widget? rightWidget;
  CzSelectDate({
    Key? key,
    this.title,
    this.value,
    this.isRequired = false,
    this.showRight = true,
    this.ontap,
    this.subWidget,
    this.padding,
    this.leftWidget,
    this.rightWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScalableWell(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusScope.of(Get.context!).requestFocus(FocusNode());
        if (ontap != null) {
          ontap!();
        }
      },
      child: Container(
          height: 48,
          padding: padding,
          decoration: BoxDecoration(
            border: Border.all(color: KColor.lineColor, width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          ),
          child: Row(
            children: [
              const SizedBox(width: 5),
              leftWidget != null
                  ? Container(
                      margin: const EdgeInsets.only(
                          top: 10, bottom: 10, right: 5, left: 5),
                      child: leftWidget,
                    )
                  : const SizedBox(
                      width: 20,
                    ),
              const SizedBox(
                width: 5,
              ),
              value != null && value!.isNotEmpty
                  ? Text(
                      value!,
                      style: KFont.lableContentStyle,
                    )
                  : Text(
                      title ?? '',
                      style: KFont.tipStyle,
                    ),
            ],
          )),
    );
  }
}
