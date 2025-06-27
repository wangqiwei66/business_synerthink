import 'package:get/get.dart';

class ActivityLogic extends GetxController {
  // 示例活动数据
  final activities = [
    {
      'type': '跨分會活動',
      'title': '【組織】活動標題欄，限制文字30字元以內，超出字數系統自動隱藏多出的文字',
      'org': '舉辦組織名稱',
      'category': '活動類型',
      'canSign': true,
      'date': '2025/3/1',
      'location': '銅鑼灣',
      'fee': '\$1,000',
      'people': '30',
      'host': 'ABCD CHAPTER',
      'img': 'assets/img/mail1.jpg',
    },
  ].obs;
}
