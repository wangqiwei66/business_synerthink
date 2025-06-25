import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tiny_weight/app/widgets/full_screen_image_page.dart';
import 'package:tiny_weight/app/widgets/scalable.dart';

class SingleHorizontalImagesRow extends StatelessWidget {
  final List<String> images;

  const SingleHorizontalImagesRow({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return ScalableWell(
            onTap: () {
              //檢視大圖

              Get.to(() => FullScreenImagePage(
                    images: images,
                    initialIndex: index,
                  ))?.then((_) {
                // 手动释放焦点，隐藏键盘
                FocusScope.of(Get.context!).unfocus();
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  images[index],
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
