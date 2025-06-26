import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AiSearchLogic extends GetxController {
  // 常见搜索项目
  final List<String> searchTabs = ['項目名稱一', '項目名稱二', '項目名稱三', '項目名稱四'];
  final List<List<String>> searchTags = [
    ['活動名稱一', '活動名稱二'],
    ['活動名稱三'],
    ['活動名稱四'],
    ['活動名稱四'],
  ];

  // 聊天内容
  final RxList<Map<String, dynamic>> messages = <Map<String, dynamic>>[
    {
      'from': 'ai',
      'avatar': 'assets/img/app_icon.png',
      'text': '您好，請問需要點什麼？',
      'type': 'text',
    },
    {
      'from': 'user',
      'avatar': 'assets/img/about_me_icon.png',
      'text': '我想找一找有沒有一些適合我的手錶？',
      'type': 'text',
    },
    {
      'from': 'ai',
      'avatar': 'assets/img/app_icon.png',
      'type': 'rich',
      'title': '推薦商品種類',
      'action': '請按此',
      'desc': '請問有沒有特定需要的功能？\n可以按照你需要的功能找到合適商品。',
      'tags': ['智能手錶', '運動手錶', '機械手錶', '收藏級手錶', '兒童手錶 ...'],
    },
    {
      'from': 'user',
      'avatar': 'assets/img/about_me_icon.png',
      'type': 'wait',
    },
  ].obs;

  // 底部推荐按钮
  final List<String> bottomActions = [
    '找全部時段最熱門的商品',
    '找利潤最高的商品',
    '找相關的類將商品',
  ];

  // 输入框
  final TextEditingController inputController = TextEditingController();
}
