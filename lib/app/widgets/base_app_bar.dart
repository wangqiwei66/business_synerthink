import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiny_weight/app/config/font.dart';
import 'package:tiny_weight/app/config/path.dart';
import 'package:tiny_weight/app/widgets/divider.dart';
import 'package:tiny_weight/app/widgets/scalable.dart';

class BaseAppBar extends StatelessWidget {
  final String title;
  final bool showBack;
  final String? backIcon;
  final Function()? onBack;

  const BaseAppBar({
    Key? key,
    required this.title,
    this.showBack = true,
    this.backIcon,
    this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 48,
        child: Row(
          children: [
            const SizedBox(width: 10),
            showBack
                ? ScalableWell(
                    onTap: onBack ?? () => Get.back(),
                    child: Image.asset(
                      backIcon ?? '${base_img_path}back.png',
                      width: 40,
                      height: 40,
                    ),
                  )
                : const SizedBox(),
            Expanded(
                child: Text(
              title,
              textAlign: TextAlign.center,
              style: KFont.appTitleStyle,
            )),
            const SizedBox(width: 40)
          ],
        ),
      ),
      const SizedBox(height: 6),
    ]);
  }
}
