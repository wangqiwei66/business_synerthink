import 'package:flutter/material.dart';
import 'package:tiny_weight/app/config/path.dart';

class HomeScaffold extends StatelessWidget {
  final Widget child;
  bool isHomepage;
  HomeScaffold({Key? key, required this.child, this.isHomepage = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          Image.asset(
            '${base_img_path}home_bg.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          SafeArea(child: child)
        ]));
  }
}
