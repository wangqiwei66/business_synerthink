import 'package:flutter/material.dart';
import 'package:tiny_weight/app/config/color.dart';

class CZTabBar extends StatelessWidget {
  final TabController controller;
  final List<String> tabTitles;

  const CZTabBar({
    Key? key,
    required this.controller,
    required this.tabTitles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 0),
      height: 48,
      child: TabBar(
        padding: EdgeInsets.zero,
        labelColor: KColor.appbarColor,
        dividerHeight: 0,
        labelStyle: const TextStyle(
          color: KColor.appbarColor,
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
        indicatorColor: KColor.appbarColor,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding:
            const EdgeInsets.symmetric(horizontal: 5, vertical: -5),
        unselectedLabelColor: const Color(0x66000000),
        unselectedLabelStyle: const TextStyle(
          color: KColor.appbarColor,
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
        isScrollable: false,
        controller: controller,
        labelPadding: const EdgeInsets.only(bottom: 3),
        tabs: tabTitles
            .map((title) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(title),
                  ],
                ))
            .toList(),
      ),
    );
  }
}
