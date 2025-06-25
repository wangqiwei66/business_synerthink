// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiny_weight/app/config/color.dart';
import 'package:tiny_weight/app/widgets/scalable.dart';

class SelectItem extends StatelessWidget {
  final String? tint;
  final String? value;
  final Widget? subWidget;
  final Function? ontap;
  final EdgeInsets? padding;
  final Function(String)? onChange;
  final bool? showRight;
  final double? borderWidth;
  SelectItem({
    super.key,
    this.tint,
    this.value,
    this.showRight = true,
    this.ontap,
    this.onChange,
    this.subWidget,
    this.padding,
    this.borderWidth = 0,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = Get.mediaQuery.size.width;

    // return
    return ScalableWell(
        onTap: () {
          // FocusScope.of(context).unfocus();
          // FocusScope.of(Get.context!).requestFocus(FocusNode());
          if (ontap != null) {
            ontap!();
          }
        },
        child: Container(
            height: 30,
            padding: padding,
            child: Row(
              children: [
                SizedBox(
                    height: 30,
                    width: screenWidth * 0.5,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        value ?? tint ?? '',
                        style: TextStyle(
                            fontSize: 16,
                            color: value == null || value == ''
                                ? KColor.hintfColor
                                : KColor.textblackColor),
                      ),
                    )),
                // CzIconBorderTextField(
                //   height: 30,
                //   width: screenWidth * 0.6,
                //   hintText: title,
                //   hintColor: const Color(0xffBEC5C9),
                //   bgColor: Colors.white,
                //   value: value,
                //   radius: BorderRadius.circular(15),
                //   isEamilLowCode: true,
                //   borderWidth: borderWidth ?? 1,
                //   // valChanged: (val) {
                //   //   onChange!(val);
                //   // },
                // ),
                Expanded(
                    child: Container(
                  alignment: Alignment.centerRight,
                  child: subWidget == null
                      ? Text(
                          value ?? '',
                          textAlign: TextAlign.right,
                        )
                      : subWidget!,
                )),
                if (showRight == true)
                  const SizedBox(
                    width: 5,
                  ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                )
              ],
            )));
  }
}
