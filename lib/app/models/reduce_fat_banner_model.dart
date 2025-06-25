/// 单个菜谱模型
class CookbookModel {
  final int id;
  final String uuid;
  final String name;
  final int topicType;
  final String description;
  final String coverImage;
  final int isDelicious;
  final int isWeightLoss;
  final int isDefault;
  final int sort;
  final String remark;
  final int status;
  final String createdAt;
  final String updatedAt;

  CookbookModel({
    required this.id,
    required this.uuid,
    required this.name,
    required this.topicType,
    required this.description,
    required this.coverImage,
    required this.isDelicious,
    required this.isWeightLoss,
    required this.isDefault,
    required this.sort,
    required this.remark,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CookbookModel.fromJson(Map<String, dynamic> json) {
    return CookbookModel(
      id: json['id'] ?? 0,
      uuid: json['uuid'] ?? '',
      name: json['name'] ?? '',
      topicType: json['topic_type'] ?? 0,
      description: json['description'] ?? '',
      coverImage: (json['cover_image'] ?? '').replaceAll('`', '').trim(),
      isDelicious: json['is_delicious'] ?? 0,
      isWeightLoss: json['is_weight_loss'] ?? 0,
      isDefault: json['is_default'] ?? 0,
      sort: json['sort'] ?? 0,
      remark: json['remark'] ?? '',
      status: json['status'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}

/// 菜谱数据集合
class CookbookDataModel {
  final List<CookbookModel> cookbooks;
  final int count;

  CookbookDataModel({
    required this.cookbooks,
    required this.count,
  });

  factory CookbookDataModel.fromJson(Map<String, dynamic> json) {
    return CookbookDataModel(
      cookbooks: (json['cookbooks'] as List<dynamic>? ?? [])
          .map((e) => CookbookModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: json['count'] ?? 0,
    );
  }
}

/// banner模型
class BannerModel {
  final String image;
  final String url;

  BannerModel({
    required this.image,
    required this.url,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      image: (json['image'] ?? '').replaceAll('`', '').trim(),
      url: (json['url'] ?? '').replaceAll('`', '').trim(),
    );
  }
}

/// tab模型
class TabModel {
  final int id;
  final String title;
  final String tab;
  final String type;
  final String tag;
  final String image;
  final String url;
  final int sort;
  final int status;
  final String activityStart;
  final String activityEnd;
  final int vipKind;
  final int gender;
  final int bmiMin;
  final int bmiMax;
  final String remark;
  final String createdAt;
  final String updatedAt;

  TabModel({
    required this.id,
    required this.title,
    required this.tab,
    required this.type,
    required this.tag,
    required this.image,
    required this.url,
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

  factory TabModel.fromJson(Map<String, dynamic> json) {
    return TabModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      tab: json['tab'] ?? '',
      type: json['type'] ?? '',
      tag: json['tag'] ?? '',
      image: json['image'] ?? '',
      url: json['url'] ?? '',
      sort: json['sort'] ?? 0,
      status: json['status'] ?? 0,
      activityStart: json['activity_start'] ?? '',
      activityEnd: json['activity_end'] ?? '',
      vipKind: json['vip_kind'] ?? 0,
      gender: json['gender'] ?? 0,
      bmiMin: json['bmi_min'] ?? 0,
      bmiMax: json['bmi_max'] ?? 0,
      remark: json['remark'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}

/// 总模型
class ReduceFatBannerModel {
  final CookbookDataModel cookbookData;
  final List<BannerModel> banners;
  final List<TabModel> tab; // 新增字段

  ReduceFatBannerModel({
    required this.cookbookData,
    required this.banners,
    required this.tab,
  });

  factory ReduceFatBannerModel.fromJson(Map<String, dynamic> json) {
    return ReduceFatBannerModel(
      cookbookData: CookbookDataModel.fromJson(json['cookbook_data'] ?? {}),
      banners: (json['banners'] as List<dynamic>? ?? [])
          .map((e) => BannerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      tab: (json['tab'] as List<dynamic>? ?? [])
          .map((e) => TabModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
