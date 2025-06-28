import 'package:get/get.dart';

class MemberCenterLogic extends GetxController {
  // 组织数据
  final orgStats = {
    'orgName': '所屬組織名稱',
    'level': '等級 1',
    'totalMember': 120,
    'totalBonus': 500,
    'totalMoney': 240000,
    'target': 200000,
  };

  // 分會数据
  final branchStats = {
    'branchName': '所屬分會名稱',
    'level': '2.8K',
    'totalMember': 118,
    'totalBonus': 563,
    'totalMoney': 120000,
    'target': 120000,
    'a': 563,
    'b': 112,
    'c': 203,
    'd': 302,
  };

  // 商品点评
  final productReviews = [
    {
      'user': 'CHAN TAI MAN, TAYLOR',
      'title': '[展示] 商品標題欄，限制文字30字元以內，超出字數系統自動隱藏多餘文字',
      'price': 'HKD 9,999',
      'img': 'assets/img/amount_icon.png',
      'status': '已售出',
      'score': 5,
      'desc': '商品描述內容，超出部分自動隱藏...',
      'review': '商品評價內容...',
      'star': 5,
      'date': '2025-06-27',
    },
    {
      'user': 'KUSER 2',
      'title': '[展示] 商品標題欄，限制文字30字元以內，超出字數系統自動隱藏多餘文字',
      'price': 'HKD 9,999',
      'img': 'assets/img/activity_BG.png',
      'status': '已售出',
      'score': 4,
      'desc': '商品描述內容，超出部分自動隱藏...',
      'review': '商品評價內容...',
      'star': 4,
      'date': '2025-06-26',
    },
  ];

  // 近期活动
  final recentActivities = [
    {
      'img': 'assets/img/banner1.jpg',
      'title': '活動標題1',
      'desc': '活動描述1',
    },
    {
      'img': 'assets/img/banner2.jpg',
      'title': '活動標題2',
      'desc': '活動描述2',
    },
    {
      'img': 'assets/img/banner3.jpg',
      'title': '活動標題3',
      'desc': '活動描述3',
    },
    {
      'img': 'assets/img/activity_BG.png',
      'title': '活動標題4',
      'desc': '活動描述4',
    },
    {
      'img': 'assets/img/ajjl_normal.png',
      'title': '活動標題5',
      'desc': '活動描述5',
    },
    {
      'img': 'assets/img/amount_icon.png',
      'title': '活動標題6',
      'desc': '活動描述6',
    },
  ];
}
