import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 基础脚手架组件，提供统一的AppBar样式
class BaseScaffold extends StatelessWidget {
  /// 页面标题
  final String title;

  /// 页面主体内容
  final Widget body;

  /// 背景颜色
  final Color? backgroundColor;

  /// 是否显示返回按钮
  final bool showBackButton;

  /// 自定义返回按钮点击回调
  final VoidCallback? onBackPressed;

  const BaseScaffold({
    Key? key,
    required this.title,
    required this.body,
    this.backgroundColor = const Color(0xFFF7F7F7),
    this.showBackButton = true,
    this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: _buildAppBar(),
      body: body,
    );
  }

  /// 构建统一样式的AppBar
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 20,
              ),
              onPressed: onBackPressed ?? () => Get.back(),
            )
          : null,
      backgroundColor: backgroundColor,
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF3E3E3E),
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
