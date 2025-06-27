import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MallLogic extends GetxController {
  // 示例数据
  final userName = 'CHAN TAI MAN, TAYLOR';
  final orgName = '組織名稱';
  final groupName = '分會名稱';
  final level = 1;
  final points = 1000000;
  final contribution = 888;

  final List<String> regions = ['香港', '九龍', '新界'];
  final List<String> regionImages = [
    'assets/img/banner1.jpg',
    'assets/img/banner2.jpg',
    'assets/img/banner3.jpg',
  ];

  final List<Map<String, dynamic>> quickActions = [
    {'icon': 'gift_icon.png', 'label': '人氣商品'},
    {'icon': 'task_icon.png', 'label': '最新任務'},
    {'icon': 'hot_icon.png', 'label': '熱門搜索'},
    {'icon': 'notiofy_icon.png', 'label': '必到活動'},
    {'icon': 'cooperate_icon.png', 'label': '合作方案'},
  ];

  final List<String> adImages = [
    'assets/img/banner1.jpg',
    'assets/img/banner2.jpg',
    'assets/img/banner3.jpg',
  ];

  final List<String> recommendCategories = ['分類（一）', '分類（二）', '分類（三）'];

  final List<String> recommendImages = [
    'assets/img/banner1.jpg',
    'assets/img/banner2.jpg',
    'assets/img/banner3.jpg',
    'assets/img/meal1.jpg',
    'assets/img/meal2.jpg',
    'assets/img/meal3.jpg',
    'assets/img/banner1.jpg',
    'assets/img/banner2.jpg',
    'assets/img/banner3.jpg',
    'assets/img/meal1.jpg',
    'assets/img/meal2.jpg',
    'assets/img/meal3.jpg',
    'assets/img/banner1.jpg',
    'assets/img/banner2.jpg',
    'assets/img/banner3.jpg',
    'assets/img/meal1.jpg',
    'assets/img/meal2.jpg',
    'assets/img/meal3.jpg',
  ];
}
