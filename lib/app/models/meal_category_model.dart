/// 食谱合集分类模型
class CategoryModel {
  final int id;
  final String name;
  final String desc;
  final int isWeightLoss;
  final int sort;
  final String keywords;
  final bool status;
  final String createdAt;
  final String updatedAt;

  CategoryModel({
    required this.id,
    required this.name,
    required this.desc,
    required this.isWeightLoss,
    required this.sort,
    required this.keywords,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      desc: json['desc'] ?? '',
      isWeightLoss: json['is_weight_loss'] ?? 0,
      sort: json['sort'] ?? 0,
      keywords: json['keywords'] ?? '',
      status: json['status'] ?? false,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}

/// 卡片模型
class DietCardModel {
  final String title;
  final String desc;
  final String tag;
  final String kcal;
  final bool isUsing;
  final bool isNew;

  DietCardModel({
    required this.title,
    required this.desc,
    required this.tag,
    required this.kcal,
    this.isUsing = false,
    this.isNew = false,
  });
}
