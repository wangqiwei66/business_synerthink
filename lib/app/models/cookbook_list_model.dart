/// 菜谱列表模型，用于解析 getCookbookList 接口返回的数据
class CookbookListModel {
  final List<CookbookItem> list;
  final int total;
  final int page;
  final int pageSize;

  CookbookListModel({
    required this.list,
    required this.total,
    required this.page,
    required this.pageSize,
  });

  factory CookbookListModel.fromJson(Map<String, dynamic> json) {
    return CookbookListModel(
      list: (json['list'] as List<dynamic>?)
              ?.map((e) => CookbookItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      total: json['total'] ?? 0,
      page: json['page'] ?? 1,
      pageSize: json['page_size'] ?? 30,
    );
  }
}

/// 单个菜谱项
class CookbookItem {
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
  final int minCalories;
  final int maxCalories;

  CookbookItem({
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
    required this.minCalories,
    required this.maxCalories,
  });

  factory CookbookItem.fromJson(Map<String, dynamic> json) {
    return CookbookItem(
      id: json['id'] ?? 0,
      uuid: json['uuid'] ?? '',
      name: json['name'] ?? '',
      topicType: json['topic_type'] ?? -1,
      description: json['description'] ?? '',
      coverImage: json['cover_image'] ?? '',
      isDelicious: json['is_delicious'] ?? 0,
      isWeightLoss: json['is_weight_loss'] ?? 0,
      isDefault: json['is_default'] ?? 0,
      sort: json['sort'] ?? 0,
      remark: json['remark'] ?? '',
      status: json['status'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      minCalories: json['min_calories'] ?? 0,
      maxCalories: json['max_calories'] ?? 0,
    );
  }
}
