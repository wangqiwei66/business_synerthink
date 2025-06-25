class NewUserGuideModel {
  CardData? cardData;
  String? mealCollectionUuid;

  NewUserGuideModel({
    this.cardData,
    this.mealCollectionUuid,
  });

  factory NewUserGuideModel.fromJson(Map<String, dynamic> json) {
    return NewUserGuideModel(
      cardData: json['card_data'] == null
          ? null
          : CardData.fromJson(json['card_data'] as Map<String, dynamic>),
      mealCollectionUuid: json['meal_collection_uuid'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'card_data': cardData?.toJson(),
        'meal_collection_uuid': mealCollectionUuid,
      };
}

/// 卡片数据模型
class CardData {
  List<bool>? dietStatus;
  String? icon;
  String? subTitle;
  String? title;
  int? status;

  CardData(
      {this.dietStatus, this.icon, this.subTitle, this.title, this.status});

  factory CardData.fromJson(Map<String, dynamic> json) {
    return CardData(
      dietStatus:
          (json['diet_status'] as List?)?.map((e) => e as bool).toList(),
      icon: json['icon'] as String?,
      subTitle: json['sub_title'] as String?,
      title: json['title'] as String?,
      status: json['status'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'diet_status': dietStatus,
        'icon': icon,
        'sub_title': subTitle,
        'title': title,
        'status': status,
      };
}
