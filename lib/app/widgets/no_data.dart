import 'package:flutter/material.dart';
import 'package:tiny_weight/app/config/path.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 600,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              '${base_img_path}search_null.png',
              width: 248,
              height: 121,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 29,
            ),
            const Text(
              '暂无内容',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
