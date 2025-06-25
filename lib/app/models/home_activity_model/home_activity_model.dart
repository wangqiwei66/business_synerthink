/// 首页活动卡片模型
class HomeCardModel {
  final int id;
  final String cardTitle;
  final String cardSubtitle;
  final String cardIcon;
  final String cardButtonTitle;
  final String cardButtonTag;
  final String linkPage;
  final String vipSource;
  final int sort;
  final int status;
  final DateTime activityStart;
  final DateTime activityEnd;
  final int vipKind;
  final int gender;
  final int bmiMin;
  final int bmiMax;
  final String remark;
  final DateTime createdAt;
  final DateTime updatedAt;

  HomeCardModel({
    required this.id,
    required this.cardTitle,
    required this.cardSubtitle,
    required this.cardIcon,
    required this.cardButtonTitle,
    required this.cardButtonTag,
    required this.linkPage,
    required this.vipSource,
    required this.sort,
    required this.status,
    required this.activityStart,
    required this.activityEnd,
    required this.vipKind,
    required this.gender,
    required this.bmiMin,
    required this.bmiMax,
    required this.remark,
    required this.createdAt,
    required this.updatedAt,
  });

  /// 从JSON解析为模型对象
  factory HomeCardModel.fromJson(Map<String, dynamic> json) {
    return HomeCardModel(
      id: json['id'] as int,
      cardTitle: (json['card_title'] as String).replaceAll(r'\n', '\n'),
      cardSubtitle: (json['card_subtitle'] as String).replaceAll(r'\n', '\n'),
      cardIcon: json['card_icon'] as String,
      cardButtonTitle: json['card_button_title'] as String,
      cardButtonTag: json['card_button_tag'] as String,
      linkPage: json['link_page'] as String,
      vipSource: json['vip_source'] as String,
      sort: json['sort'] as int,
      status: json['status'] as int,
      activityStart: DateTime.parse(json['activity_start']),
      activityEnd: DateTime.parse(json['activity_end']),
      vipKind: json['vip_kind'] as int,
      gender: json['gender'] as int,
      bmiMin: json['bmi_min'] as int,
      bmiMax: json['bmi_max'] as int,
      remark: json['remark'] as String,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  /// 将模型对象转换为JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'card_title': cardTitle,
      'card_subtitle': cardSubtitle,
      'card_icon': cardIcon,
      'card_button_title': cardButtonTitle,
      'card_button_tag': cardButtonTag,
      'link_page': linkPage,
      'vip_source': vipSource,
      'sort': sort,
      'status': status,
      'activity_start': activityStart.toIso8601String(),
      'activity_end': activityEnd.toIso8601String(),
      'vip_kind': vipKind,
      'gender': gender,
      'bmi_min': bmiMin,
      'bmi_max': bmiMax,
      'remark': remark,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
