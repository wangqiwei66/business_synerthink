import 'package:flutter/material.dart';
import 'package:tiny_weight/app/config/color.dart';
import 'package:tiny_weight/app/config/font.dart';
import 'package:tiny_weight/app/widgets/divider.dart';
import 'package:tiny_weight/app/widgets/textfeild.dart';

class SingleContentRow extends StatelessWidget {
  final String title;
  final String content;

  const SingleContentRow({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: Color(0xfff5f5f5),
                    // color: Colors.red,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: SizedBox(
                        height: 40,
                        child: Text(
                          content,
                          style: const TextStyle(fontSize: 16),
                        ),
                      )),
                    ],
                  ),
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
    );
  }
}
