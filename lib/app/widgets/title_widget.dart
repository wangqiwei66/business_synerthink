// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tiny_weight/app/config/color.dart';
import 'package:tiny_weight/app/config/path.dart';
import 'package:tiny_weight/app/widgets/scalable.dart';

class CzTitleWidget extends StatelessWidget {
  final String? iconPath;
  final String? title;
  final String? subText;
  final Function? onTap;

  const CzTitleWidget({
    Key? key,
    this.iconPath,
    this.onTap,
    this.subText,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScalableWell(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        height: 30,
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: Row(
          children: [
            if (iconPath != null) Image.asset(base_img_path + (iconPath ?? '')),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: AutoSizeText(
                title ?? '',
                style: const TextStyle(
                    fontFamily: "PingFang SC",
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                maxLines: 1,
              ),
            ),

            // Text(
            //   title ?? '',
            //   style: const TextStyle(
            //     color: KColor.textblackColor,
            //     fontSize: 20,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            SizedBox(
              width: 20,
            ),
            // const Expanded(child: SizedBox()),
            if (onTap != null)
              Text(
                subText ?? '更多'.tr,
                style: const TextStyle(
                  color: KColor.textGrayColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              )
          ],
        ),
      ),
    );
  }
}
