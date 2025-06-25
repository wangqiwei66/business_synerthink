// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:tiny_weight/app/config/color.dart';

class CzFoot extends ClassicalFooter {
  /// Key
  final Key? key;

  /// 方位
  final AlignmentGeometry? alignment;

  /// 提示加载文字
  String? loadText;

  /// 准备加载文字
  String? loadReadyText;

  /// 正在加载文字
  String? loadingText;

  /// 加载完成文字
  String? loadedText;

  /// 加载失败文字
  final String? loadFailedText;

  /// 没有更多文字
  String? noMoreText;

  /// 显示额外信息(默认为时间)
  final bool showInfo;

  /// 更多信息
  String? infoText;

  /// 背景颜色
  final Color bgColor;

  /// 字体颜色
  final Color textColor;

  /// 更多信息文字颜色
  final Color infoColor;

  CzFoot({
    double extent = 60.0,
    double triggerDistance = 70.0,
    bool float = false,
    Duration? completeDuration = const Duration(seconds: 1),
    bool enableInfiniteLoad = true,
    bool enableHapticFeedback = true,
    bool overScroll = false,
    bool safeArea = true,
    EdgeInsets? padding,
    this.key,
    this.alignment,
    this.loadText = "上拉加载更多",
    this.loadReadyText = "松开后加载更多",
    this.loadingText = "加载中...",
    this.loadedText = "加载完成",
    this.noMoreText = "沒有更多內容",
    this.infoText = "最后更新于 %T",
    // this.loadText,
    // this.loadReadyText,
    // this.loadingText,
    // this.loadedText,
    this.loadFailedText,
    // this.noMoreText,
    this.showInfo = true,
    // this.infoText,
    this.bgColor = Colors.transparent,
    this.textColor = Colors.black,
    this.infoColor = KColor.appbarColor,
  }) : super(
          extent: extent,
          triggerDistance: triggerDistance,
          float: float,
          completeDuration: completeDuration,
          enableInfiniteLoad: enableInfiniteLoad,
          enableHapticFeedback: enableHapticFeedback,
          overScroll: overScroll,
          safeArea: safeArea,
          padding: padding,
        );

  @override
  Widget contentBuilder(
      BuildContext context,
      LoadMode loadState,
      double pulledExtent,
      double loadTriggerPullDistance,
      double loadIndicatorExtent,
      AxisDirection axisDirection,
      bool float,
      Duration? completeDuration,
      bool enableInfiniteLoad,
      bool success,
      bool noMore) {
    loadText = "上拉加载更多".tr;
    loadReadyText = "松开后加载更多".tr;
    loadingText = "加载中...".tr;
    loadedText = "加载完成".tr;
    noMoreText = "沒有更多內容".tr;
    infoText = "最后更新于 %T".tr;
    return ClassicalFooterWidget(
      key: key,
      classicalFooter: this,
      loadState: loadState,
      pulledExtent: pulledExtent,
      loadTriggerPullDistance: loadTriggerPullDistance,
      loadIndicatorExtent: loadIndicatorExtent,
      axisDirection: axisDirection,
      float: float,
      completeDuration: completeDuration,
      enableInfiniteLoad: enableInfiniteLoad,
      success: success,
      noMore: noMore,
    );
  }
}
