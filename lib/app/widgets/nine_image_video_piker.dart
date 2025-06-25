// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiny_weight/app/common/image_utils.dart';
import 'package:tiny_weight/app/config/path.dart';
import 'package:tiny_weight/app/widgets/bottom_sheet.dart';
import 'package:tiny_weight/app/widgets/scalable.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';
// import 'package:wechat_assets_picker/wechat_assets_picker.dart';

enum ImageType {
  asset,
  net,
  local,
}

class SelectPhotoOrVideoWidget extends StatefulWidget {
  ///每次點選選擇圖片後的回撥
  final Function(List<String>)? imageSelectAction;

  ///自定義標題
  final Widget? header;

  ///標題下的小捍
  final String? tips;

  ///預顯示使用的圖片
  final List<String>? imageList;

  ///最多可選擇的圖片數量
  final int maxSelect;

  ///為true 時顯示使用網路圖片
  final ImageType imageType;

  final bool isClip;

  const SelectPhotoOrVideoWidget({
    super.key,
    this.header,
    this.tips,
    this.imageList,
    this.imageType = ImageType.local,
    this.imageSelectAction,
    this.isClip = false,
    this.maxSelect = 5,
  });

  @override
  State<StatefulWidget> createState() {
    return _SelectPhotoOrVideoWidgetState();
  }
}

class _SelectPhotoOrVideoWidgetState extends State<SelectPhotoOrVideoWidget>
    with WidgetsBindingObserver {
  ///當前是否正在選擇圖片
  bool _isSelect = false;
  @override
  void initState() {
    super.initState();
    if (widget.imageList != null) {
      //判斷一下最大選擇圖片資料
      if (widget.imageList!.length <= widget.maxSelect) {
        _imageList = widget.imageList!;
      } else {
        //擷取圖片
        _imageList = widget.imageList!.sublist(0, widget.maxSelect);
      }
    }
    //繫結檢視監聽
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        // 處於這種狀態的應用程式應該假設它們可能在任何時候暫停。
        break;
      case AppLifecycleState.resumed:
        //從後臺切換前臺，介面可見
        break;
      case AppLifecycleState.paused:
        // 介面不可見，後臺
        break;
      case AppLifecycleState.detached:
        // APP結束時呼叫
        break;
      case AppLifecycleState.hidden:
        // TODO: Handle this case.
        break;
    }
  }

  @override
  void dispose() {
    //解綁檢視監聽
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //圓角矩形剪裁
    return ClipRRect(
      //圓角
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: Container(
        color: Colors.transparent,
        //寬度填充
        width: double.infinity,
        //統一內邊距
        padding: const EdgeInsets.all(10),
        //垂直方向的線性排列
        child: Column(
          //水平方向
          crossAxisAlignment: CrossAxisAlignment.start,
          //包裹
          mainAxisSize: MainAxisSize.min,
          children: [
            //標題
            buildHeaderWidget(),
            //第二行的小提示
            buildTipsWidget(),
            //顯示的圖片
            buildGridView(),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  buildHeaderWidget() {
    return widget.header ?? Container();
  }

  buildTipsWidget() {
    if (widget.tips == null || (widget.tips ?? '').isEmpty) {
      return Container();
    }
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 16),
      //圓角矩形裁剪
      child: ClipRRect(
        //圓角
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: Container(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 6, bottom: 6),
          color: const Color(0xffFFF1F1),
          child: Text(
            "${widget.tips}",
            style: const TextStyle(
              color: Color(0xffBD2F2F),
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  List<String> _imageList = [];

  buildGridView() {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      //包裹
      shrinkWrap: true,
      //不可滑動
      physics: const NeverScrollableScrollPhysics(),
      //圖片個數
      itemCount: getSelectCount(),
      //SliverGridDelegateWithFixedCrossAxisCount 構建一個橫軸固定數量Widget
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //橫軸元素個數
          crossAxisCount: 4,
          //主軸間距
          mainAxisSpacing: 1.0,
          //從軸間距
          crossAxisSpacing: 1.0,
          //子元件寬高長度比例
          childAspectRatio: 1.0),
      itemBuilder: (BuildContext context, int index) {
        //Widget Function(BuildContext context, int index)
        if (index == _imageList.length) {
          if (_isSelect) {
            return const Center(child: Text("..."));
          }
          return ScalableWell(
            onTap: () {
              onSelectImageFunction();
            },
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(20),
              color: const Color(0xFFF1F1F2),
              child: Image.asset('${base_img_path}icon_img_add.png'),
            ),
          );
        }
        //顯示當前的圖片
        String imageUrl = _imageList[index];
        return _buildDragAbleItem(imageUrl, index);

        // Container(
        //   //層疊佈局
        //   child: Stack(
        //     children: [
        //       //向左下偏移一點
        //       Positioned.fill(
        //         top: 10,
        //         right: 10,
        //         child: GestureDetector(
        //           onTap: () {
        //             //檢視大圖
        //           },
        //           child: Container(
        //             padding: const EdgeInsets.all(1),
        //             child:

        //                 // _buildDragAbleItem(imageUrl),

        //                 buildImageWidget(imageUrl),
        //             color: Colors.grey[200],
        //           ),
        //         ),
        //       ),
        //       Positioned(
        //         top: 0,
        //         right: 0,
        //         child: GestureDetector(
        //           onTap: () {
        //             onDeleteImageFunction(index);
        //           },
        //           child: ClipOval(
        //             child: Container(
        //               padding: const EdgeInsets.all(2),
        //               color: Colors.red,
        //               child: const Icon(
        //                 Icons.close,
        //                 color: Colors.white,
        //                 size: 14,
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // );
      },
    );
  }

  Widget _buildDragAbleItem(String value, index) {
    return Draggable(
      data: value,
      // feedback: 跟隨手指移動的檢視
      feedback: SizedBox(
        width: 100,
        height: 100,
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            child: CachedNetworkImage(
              imageUrl: value,
              fit: BoxFit.cover,
            )

            //  Image.network(
            //   value,
            //   fit: BoxFit.cover,
            // ),
            ),
      ),
      onDragStarted: () {
        // 開始拖拽
        _onDragStartedAction(value);
      },
      onDraggableCanceled: (Velocity velocity, Offset offset) {
        //清空標記，進行重新繪製
        _onDraggableCanceledAction();
      },
      onDragCompleted: () {
        //清空標記，進行重新繪製
        _onDraggableCanceledAction();
      },
      child: DragTarget(
        // candidateData為onWillAccept回撥為true時可接收的資料列表，rejectedData為onWillAccept回撥為false時拒絕時的資料列表
        builder: (context, candidateData, rejectedData) {
          return _buildItem(value, index);
          //  buildImageWidget(value);
        },
        // 當拖拽錨點進入DragTarget範圍時回撥，true時會將Data資料新增到candidateData列表中；false時會將Data資料新增到rejectedData列表中
        onWillAcceptWithDetails: (moveData) {
          var accept = moveData != null;
          if (accept) {
            _exchangeItemAction(
                {'moveData': moveData, 'toData': value, 'onAccept': false});
          }
          return accept;
        },
        // 接收Data資料，只有onWillAccept返回true且拖拽結束時拖拽錨點位於DragTarget內才會回撥
        onAcceptWithDetails: (moveData) {
          _exchangeItemAction(
              {'moveData': moveData, 'toData': value, 'onAccept': true});
        },
      ),
    );
  }

// 開始拖拽 記錄開始拖拽的資料
  void _onDragStartedAction(String url) {
    setState(() {});
  }

// 拖拽取消
  void _onDraggableCanceledAction() {
    setState(() {});
  }

// 資料交換
  void _exchangeItemAction(Map info) {
    setState(() {
      var toIndex = _imageList.indexOf(info['toData']);
      var moveData = info['moveData'];
      var onAccept = info['onAccept'];
      _imageList.remove(moveData);
      _imageList.insert(toIndex, moveData);

      if (onAccept) {
        widget.imageSelectAction!(_imageList);
      }
    });
  }

  Widget _buildItem(imageUrl, index) {
    return Stack(
      children: [
        //向左下偏移一點
        Positioned.fill(
          top: 10,
          right: 10,
          child: GestureDetector(
            onTap: () {
              //檢視大圖
            },
            child: Container(
              padding: const EdgeInsets.all(1),
              color: Colors.grey[200],
              child:

                  // _buildDragAbleItem(imageUrl),

                  buildImageWidget(imageUrl),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {
              onDeleteImageFunction(index);
            },
            child: ClipOval(
              child: Container(
                padding: const EdgeInsets.all(2),
                color: Colors.red,
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 14,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildImageWidget(String image) {
    if (image.split('.').last == 'png' || image.split('.').last == 'jpg') {
      return Image.file(
        File(image),
        fit: BoxFit.fitWidth,
      );
    } else {
      VideoPlayerController controller =
          VideoPlayerController.file(File(image));

      controller.addListener(() {
        // print(_controller!.value);
        // _controller.value.duration.inMicroseconds;
      });
      // ignore: avoid_single_cascade_in_expression_statements
      controller
        ..initialize().then((value) async {
          await controller.setVolume(0);
          // await _controller.setLooping(true);
          // await _controller.play();
          // setState(() {});
        });

      //非同步執行完的回撥
      // .whenComplete(() => setState(() {}));

      return AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: VideoPlayer(
          controller,
        ),
      );
    }

    // if ((widget.imageType == ImageType.net) || (image.contains('http'))) {
    //   return CachedNetworkImage(
    //     imageUrl: image,
    //     fit: BoxFit.fitWidth,
    //     placeholder: (context, url) => const SizedBox(
    //       width: 40,
    //       height: 40,
    //       child: Center(
    //         child: CircularProgressIndicator(
    //           strokeWidth: 2,
    //         ),
    //       ),
    //     ),
    //   );

    //   // ExtendedImage.network(
    //   //   image,
    //   //   fit: BoxFit.fitWidth,
    //   //   // width: double.infinity,
    //   //   // height: 95,
    //   // );
    //   //  ExtendSelectionDownTextIntent()
    //   // Image.network(
    //   //   image,
    //   //   fit: BoxFit.fitWidth,
    //   // );
    // } else if (widget.imageType == ImageType.asset) {
    //   return Image.asset(
    //     image,
    //     fit: BoxFit.fitWidth,
    //   );
    // }

    // return Image.file(
    //   File(image),
    //   fit: BoxFit.fitWidth,
    // );
  }

  ///最大選擇圖片資料限制
  getSelectCount() {
    if (_imageList.length >= widget.maxSelect) {
      return widget.maxSelect;
    }
    return _imageList.length + 1;
  }

  //刪除照片
  void onDeleteImageFunction(int index) {
    _imageList.removeAt(index);
    setState(() {});
    widget.imageSelectAction!(_imageList);
  }

  void onSelectImageFunction() async {
    setState(() {
      _isSelect = true;
    });

    await showDialog(
        barrierDismissible: true, //是否點選空白區域關閉對話方塊,預設為true，可以關閉
        context: context,
        builder: (BuildContext context) {
          var list = [
            {'name': '圖片'.tr},
            {'name': '影片'.tr}
          ];

          return MisBottomSheet(
            list: list,
            onItemClickListener: (index) async {
              List<String> soucesUrl = [];
              List<XFile?>? assets;
              // // XFile? souce;

              try {
                if (index == 0) {
                  assets = await ImageUtils().pickMultiImage();
                  if ((assets ?? []).isNotEmpty) {
                    if (assets!.length > widget.maxSelect - _imageList.length) {
                      assets = assets.sublist(
                          0, (widget.maxSelect - _imageList.length));
                    }

                    for (var e in assets) {
                      soucesUrl.add(e!.path);
                    }
                  }
                } else if (index == 1) {
                  XFile? souce = await ImageUtils().pickerVideo(
                      source: PickerType.gallery,
                      maxDuration: const Duration(seconds: 15));

                  if (souce != null) {
                    soucesUrl = [souce.path];
                  }
                }
                setState(() {
                  _isSelect = false;
                });
                // if (souces != null) {
                _imageList.addAll(soucesUrl);
                setState(() {});
                widget.imageSelectAction!(_imageList);
              } catch (e) {
                setState(() {
                  _isSelect = false;
                });
              }
            },
          );
        });
    setState(() {
      _isSelect = false;
    });
  }
}
