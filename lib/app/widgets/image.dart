import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tiny_weight/app/config/path.dart';

class CzImageWidget extends StatefulWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final String? errImagePath;
  final bool? showloading;
  const CzImageWidget({
    Key? key,
    this.imageUrl = '',
    this.width,
    this.height,
    this.fit,
    this.errImagePath,
    this.showloading = false,
  }) : super(key: key);

  @override
  State<CzImageWidget> createState() => _CzImageWidgetState();
}

class _CzImageWidgetState extends State<CzImageWidget> {
  @override
  Widget build(BuildContext context) {
    Widget errorWidget = Image.asset(
      widget.errImagePath ?? '${base_img_path}my_1_BG.png',
      height: widget.height,
      width: widget.width,
      fit: BoxFit.cover,
    );
    if ((widget.imageUrl ?? '').isEmpty) {
      return errorWidget;
    }

    return CachedNetworkImage(
      imageUrl: widget.imageUrl ?? "",
      height: widget.height,
      width: widget.width,
      fit: widget.fit ?? BoxFit.cover,
      placeholder: widget.showloading == true
          ? (context, url) => SizedBox(
                width: widget.width,
                height: widget.height ?? 100,
                child: const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
              )
          : null,
      errorWidget: (context, url, error) {
        return errorWidget;
      },
    );
  }
}
