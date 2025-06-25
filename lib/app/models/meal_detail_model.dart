import 'package:tiny_weight/app/models/meal_collection_model/meal_collection_model.dart';
import 'dart:convert';

/// 单餐模型
class MealItemModel {
  final int id;
  final String uuid;
  final int mealType;
  final String mainIngredients; // 直接存储逗号分隔的配料字符串
  final int totalCalorie;
  final double totalProtein;
  final int isWeightLoss;
  final int isDelicious;
  final int status;
  final String createdAt;
  final String updatedAt;

  MealItemModel({
    required this.id,
    required this.uuid,
    required this.mealType,
    required this.mainIngredients,
    required this.totalCalorie,
    required this.totalProtein,
    required this.isWeightLoss,
    required this.isDelicious,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  /// 从 Map 解析生成 MealItemModel，并将 main_ingredients 解析为逗号分隔字符串
  factory MealItemModel.fromJson(Map<String, dynamic> json) {
    String ingredientsStr = '';
    try {
      final raw = json['main_ingredients'] ?? '';
      if (raw.isNotEmpty) {
        // 先去掉外层引号（如果有），再做两次 jsonDecode
        dynamic decoded = raw;
        if (raw is String && raw.startsWith('"') && raw.endsWith('"')) {
          decoded = jsonDecode(raw); // 第一次解码，得到字符串数组的字符串
        }
        final List<dynamic> arr = jsonDecode(decoded);
        ingredientsStr = arr.map((e) => e.toString()).join('，');
      }
    } catch (e) {
      ingredientsStr = json['main_ingredients'] ?? '';
    }
    return MealItemModel(
      id: json['id'],
      uuid: json['uuid'] ?? '',
      mealType: json['meal_type'] ?? 0,
      mainIngredients: ingredientsStr,
      totalCalorie: json['total_calorie'] ?? 0,
      totalProtein: (json['total_protein'] is int)
          ? (json['total_protein'] as int).toDouble()
          : (json['total_protein'] ?? 0.0),
      isWeightLoss: json['is_weight_loss'] ?? 0,
      isDelicious: json['is_delicious'] ?? 0,
      status: json['status'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  /// 获取主食材的逗号分隔字符串
  String get mainIngredientsCommaSeparated {
    try {
      if (mainIngredients.isEmpty) return '';
      // 先反序列化为 List
      final List<dynamic> decoded = jsonDecode(mainIngredients);
      return decoded.map((e) => e.toString()).join('，');
    } catch (e) {
      return mainIngredients;
    }
  }
}

/// 食谱基本信息模型
class CookBookModel {
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

  CookBookModel({
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

  /// 从 Map 解析生成 CookBookModel
  factory CookBookModel.fromJson(Map<String, dynamic> json) {
    return CookBookModel(
      id: json['id'],
      uuid: json['uuid'] ?? '',
      name: json['name'] ?? '',
      topicType: json['topic_type'] ?? 0,
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
    );
  }
}

/// 食谱详情主模型
class MealDetailModel {
  final CookBookModel cookbook;
  final List<Dish> dishes;
  final List<MealItemModel> meals; // 新增字段
  final bool isCollected; // 新增字段
  MealDetailModel({
    required this.cookbook,
    required this.dishes,
    required this.meals,
    this.isCollected = false, // 默认值为 false
  });

  /// 从 Map 解析生成 MealDetailModel
  factory MealDetailModel.fromJson(Map<String, dynamic> json) {
    List<Dish> dishesList = [];
    if (json['dishes'] != null) {
      dishesList = List<Map<String, dynamic>>.from(json['dishes'])
          .map((e) => Dish.fromJson(e))
          .toList();
    }
    // meals 字段兼容两种来源：主 data 下和 cookbook 下
    List<MealItemModel> mealsList = [];
    if (json['meals'] != null) {
      mealsList = List<Map<String, dynamic>>.from(json['meals'])
          .map((e) => MealItemModel.fromJson(e))
          .toList();
    }

    return MealDetailModel(
        cookbook: CookBookModel.fromJson(json['cookbook'] ?? {}),
        dishes: dishesList,
        meals: mealsList,
        isCollected: json['is_collected'] == 1);
  }
}
