import 'package:flutter/material.dart';
import 'package:tiny_weight/app/config/color.dart';

class BaseListCell extends StatelessWidget {
  const BaseListCell({
    super.key,
    required this.title,
    required this.content,
    this.padding = const EdgeInsets.fromLTRB(16, 4, 16, 4), // 新增 padding 参数
  });

  final Widget title;
  final Widget content;
  final EdgeInsets padding; // 定义 padding 属性

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Material(
        color: KColor.listBgColor,
        clipBehavior: Clip.hardEdge,
        // elevation: 2.0,
        shadowColor: Colors.black,
        borderRadius: BorderRadius.circular(23),
        child: Container(
          padding: const EdgeInsets.fromLTRB(2, 15, 2, 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title,
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(23)),
                  border: Border.all(color: Colors.white, width: 1),
                ),
                child: content,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
