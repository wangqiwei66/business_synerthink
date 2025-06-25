import 'package:flutter/material.dart';
import 'package:tiny_weight/app/config/color.dart';
import 'package:tiny_weight/app/config/font.dart';
import 'package:tiny_weight/app/widgets/divider.dart';
import 'package:tiny_weight/app/widgets/scalable.dart';

class SingleActionRow extends StatelessWidget {
  final String title;
  final String actionTip;

  final ValueChanged<String>? onAction;

  const SingleActionRow({
    Key? key,
    required this.title,
    required this.actionTip,
    this.onAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onAction != null) {
          onAction!('action');
        }
      },
      child: Container(
        // height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
        width: double.infinity,
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 120,
                  child: Text(
                    title,
                    style: KFont.titleStyle.copyWith(fontSize: 14),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        actionTip,
                        style: KFont.listStyle
                            .copyWith(fontSize: 14, color: KColor.appbarColor),
                      ),
                      const Icon(Icons.arrow_forward_ios,
                          size: 16, color: KColor.appbarColor)
                    ],
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            CzDivider(),
          ],
        ),
      ),
    );
  }
}
