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

  final List<Map<String, dynamic>> quickActions = [
    {'icon': 'gift_icon.png', 'label': '人氣商品'},
    {'icon': 'task_icon.png', 'label': '最新任務'},
    {'icon': 'hot_icon.png', 'label': '熱門搜索'},
    {'icon': 'notiofy_icon.png', 'label': '必到活動'},
    {'icon': 'cooperate_icon.png', 'label': '合作方案'},
  ];
  // 分會数据
  final branchStats = {
    'branchName': '所屬分會名稱',
    'branchPosition': '分會擔任職銜',
    'contributionValue': '52.8K',
    'joinedDays': 118,
    'memberCount': 80,
    'completedTasks': 563,
    'assistedActivities': 112,
    'completedTransactions': 203,
    'participatedActivities': 302,
    'totalBonus': 120000,
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
      'title': '[香港] 活動主題顯示文字',
      'desc': '顯示文字只限兩行，顯示文字隻顯示兩行. 過了就不顯示了. ',
      'location': '香港',
    },
    {
      'img': 'assets/img/banner2.jpg',
      'title': '[香港] 活動主題顯示文字',
      'desc': '顯示文字只限兩行，顯示文字隻顯示兩行. 過了就不顯示了. ',
      'location': '香港',
    },
    {
      'img': 'assets/img/banner3.jpg',
      'title': '[香港] 活動主題顯示文字',
      'desc': '顯示文字只限兩行，顯示文字隻顯示兩行. 過了就不顯示了. ',
      'location': '香港',
    },
    {
      'img': 'assets/img/meal1.jpg',
      'title': '[香港] 活動主題顯示文字',
      'desc': '顯示文字只限兩行，顯示文字隻顯示兩行. 過了就不顯示了. ',
      'location': '香港',
    },
    {
      'img': 'assets/img/meal3.jpg',
      'title': '[香港] 活動主題顯示文字',
      'desc': '顯示文字只限兩行，顯示文字隻顯示兩行. 過了就不顯示了. ',
      'location': '香港',
    },
    {
      'img': 'assets/img/meal2.jpg',
      'title': '[香港] 活動主題顯示文字',
      'desc': '顯示文字只限兩行，顯示文字隻顯示兩行. 過了就不顯示了. ',
      'location': '香港',
    },
  ];

  // 地区筛选选项
  final locationFilters = ['香港', '九龍', '新界'];

  // 当前选中的地区
  var selectedLocation = '香港'.obs;
}
