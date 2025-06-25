import 'package:tiny_weight/app/models/meal_collection_model/meal_collection_model.dart';

/// 收藏食谱专题模型
class CollectCookBook {
  final Cookbook cookbook;
  final List<Dish> dishes;
  final int isCollected;

  CollectCookBook({
    required this.cookbook,
    required this.dishes,
    required this.isCollected,
  });

  factory CollectCookBook.fromJson(Map<String, dynamic> json) {
    // 修复：确保 cookbook 字段为 Map<String, dynamic>
    final cookbookJson = json['cookbook'];
    // 修复：确保 dishes 字段为 List
    final dishesJson = json['dishes'];
    return CollectCookBook(
      cookbook: Cookbook.fromJson(
          cookbookJson is Map<String, dynamic> ? cookbookJson : {}),
      dishes: (dishesJson is List ? dishesJson : <dynamic>[])
          .whereType<Map<String, dynamic>>()
          .map((e) => Dish.fromJson(e))
          .toList(),
      isCollected: json['is_collected'] ?? 0,
    );
  }
}

/// 单个食谱信息
class Cookbook {
  final String coverImage;
  final String createdAt;
  final String description;
  final int id;
  final int isDefault;
  final int isDelicious;
  final int isWeightLoss;
  final String name;
  final String remark;
  final int sort;
  final int status;
  final int topicType;
  final String updatedAt;
  final String uuid;

  Cookbook({
    required this.coverImage,
    required this.createdAt,
    required this.description,
    required this.id,
    required this.isDefault,
    required this.isDelicious,
    required this.isWeightLoss,
    required this.name,
    required this.remark,
    required this.sort,
    required this.status,
    required this.topicType,
    required this.updatedAt,
    required this.uuid,
  });

  factory Cookbook.fromJson(Map<String, dynamic> json) {
    return Cookbook(
      coverImage: json['cover_image'] ?? '',
      createdAt: json['created_at'] ?? '',
      description: json['description'] ?? '',
      id: json['id'] ?? 0,
      isDefault: json['is_default'] ?? 0,
      isDelicious: json['is_delicious'] ?? 0,
      isWeightLoss: json['is_weight_loss'] ?? 0,
      name: json['name'] ?? '',
      remark: json['remark'] ?? '',
      sort: json['sort'] ?? 0,
      status: json['status'] ?? 0,
      topicType: json['topic_type'] ?? 0,
      updatedAt: json['updated_at'] ?? '',
      uuid: json['uuid'] ?? '',
    );
  }
}
