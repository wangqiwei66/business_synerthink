// 一周减脂美味食谱模型及其相关模型

import 'dart:convert';

class MealCollectionModel {
  MealCollection? mealCollection;
  List<MealCollectionDetail>? mealCollectionDetails;

  MealCollectionModel({
    this.mealCollection,
    this.mealCollectionDetails,
  });

  /// 从 JSON 构造 MealCollectionModel
  factory MealCollectionModel.fromJson(Map<String, dynamic> json) {
    return MealCollectionModel(
      mealCollection: json['meal_collection'] != null
          ? MealCollection.fromJson(json['meal_collection'])
          : null,
      mealCollectionDetails: (json['meal_collection_details'] as List<dynamic>?)
          ?.map((e) => MealCollectionDetail.fromJson(e))
          .toList(),
    );
  }
}

class MealCollection {
  int? id;
  String? uuid;
  String? name;
  String? description;
  String? coverImage;
  bool? isDelicious;
  bool? isWeightLoss;
  bool? isDefault;
  int? selectedCount;
  int? sort;
  String? remark;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  MealCollection({
    this.id,
    this.uuid,
    this.name,
    this.description,
    this.coverImage,
    this.isDelicious,
    this.isWeightLoss,
    this.isDefault,
    this.selectedCount,
    this.sort,
    this.remark,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory MealCollection.fromJson(Map<String, dynamic> json) {
    return MealCollection(
      id: json['id'],
      uuid: json['uuid'],
      name: json['name'],
      description: json['description'],
      coverImage: json['cover_image'],
      isDelicious: json['is_delicious'] == 1,
      isWeightLoss: json['is_weight_loss'] == 1,
      isDefault: json['is_default'] == 1,
      selectedCount: json['selected_count'],
      sort: json['sort'],
      remark: json['remark'],
      status: json['status'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }
}

class MealCollectionDetail {
  MealDetail? mealDetails;
  List<MealWithDishes>? meals;

  MealCollectionDetail({
    this.mealDetails,
    this.meals,
  });

  factory MealCollectionDetail.fromJson(Map<String, dynamic> json) {
    return MealCollectionDetail(
      mealDetails: json['meal_details'] != null
          ? MealDetail.fromJson(json['meal_details'])
          : null,
      meals: (json['meals'] as List<dynamic>?)
          ?.map((e) => MealWithDishes.fromJson(e))
          .toList(),
    );
  }
}

class MealDetail {
  int? id;
  String? uuid;
  String? mealCollectionUuid;
  int? dayOrder;
  bool? isFasting;
  String? description;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  MealDetail({
    this.id,
    this.uuid,
    this.mealCollectionUuid,
    this.dayOrder,
    this.isFasting,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory MealDetail.fromJson(Map<String, dynamic> json) {
    return MealDetail(
      id: json['id'],
      uuid: json['uuid'],
      mealCollectionUuid: json['meal_collection_uuid'],
      dayOrder: json['day_order'],
      isFasting: json['is_fasting'] == 1,
      description: json['description'],
      status: json['status'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }
}

class MealWithDishes {
  Meal? meal;
  List<Dish>? dishes;

  MealWithDishes({
    this.meal,
    this.dishes,
  });

  factory MealWithDishes.fromJson(Map<String, dynamic> json) {
    return MealWithDishes(
      meal: json['meal'] != null ? Meal.fromJson(json['meal']) : null,
      dishes: (json['dishes'] as List<dynamic>?)
          ?.map((e) => Dish.fromJson(e))
          .toList(),
    );
  }
}

class Meal {
  int? id;
  String? uuid;
  int? mealType;
  List<String>? mainIngredients;
  num? totalCalorie;
  num? totalProtein;
  bool? isWeightLoss;
  bool? isDelicious;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Meal({
    this.id,
    this.uuid,
    this.mealType,
    this.mainIngredients,
    this.totalCalorie,
    this.totalProtein,
    this.isWeightLoss,
    this.isDelicious,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  /// 从 JSON 构造 Meal 实例
  factory Meal.fromJson(Map<String, dynamic> json) {
    // 解析 main_ingredients 字段（字符串形式的 JSON 数组）
    List<String> parseMainIngredients(String? str) {
      if (str == null) return [];
      try {
        // 先去除外层引号，再 decode
        return List<String>.from(
          (str.startsWith('"') ? str.substring(1, str.length - 1) : str)
              .replaceAll(r'\"', '"')
              .replaceAll(r"\\", r"\")
              .replaceAll("'", '"')
              .replaceAll('\\"', '"')
              .replaceAll('\\\\', '\\')
              .replaceAll('\n', '')
              .replaceAll('\r', '')
              .replaceAll('\t', '')
              .replaceAll(' ', '')
              .replaceAll('[', '')
              .replaceAll(']', '')
              .split(',')
              .map((e) => e.replaceAll('"', '').trim())
              .where((e) => e.isNotEmpty),
        );
      } catch (e) {
        return [];
      }
    }

    return Meal(
      id: json['id'] as int?,
      uuid: json['uuid'] as String?,
      mealType: json['meal_type'] as int?,
      mainIngredients:
          parseMainIngredients(json['main_ingredients'] as String?),
      totalCalorie: json['total_calorie'],
      totalProtein: json['total_protein'],
      isWeightLoss: json['is_weight_loss'] == 1,
      isDelicious: json['is_delicious'] == 1,
      status: json['status'] as int?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  /// 转换为 JSON
  Map<String, dynamic> toJson() {
    // mainIngredients 转为 JSON 字符串
    String mainIngredientsToJson(List<String>? list) {
      if (list == null) return '[]';
      return '[${list.map((e) => '"$e"').join(',')}]';
    }

    return {
      'id': id,
      'uuid': uuid,
      'meal_type': mealType,
      'main_ingredients': mainIngredientsToJson(mainIngredients),
      'total_calorie': totalCalorie,
      'total_protein': totalProtein,
      'is_weight_loss': isWeightLoss == true ? 1 : 0,
      'is_delicious': isDelicious == true ? 1 : 0,
      'status': status,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}

class Dish {
  int? id;
  String? uuid;
  String? name;
  List<String>? ingredients;
  List<String>? seasonings;
  List<String>? cookingSteps;
  String? weightLossIngredients;
  String? taste;
  num? calorie;
  Map<String, dynamic>? nutrients;
  bool? isDelicious;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Dish({
    this.id,
    this.uuid,
    this.name,
    this.ingredients,
    this.seasonings,
    this.cookingSteps,
    this.weightLossIngredients,
    this.taste,
    this.calorie,
    this.nutrients,
    this.isDelicious,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Dish.fromJson(Map<String, dynamic> json) {
    return Dish(
      id: json['id'],
      uuid: json['uuid'],
      name: json['name'],
      ingredients: json['ingredients'] != null
          ? List<String>.from((jsonDecode(json['ingredients']) as List))
          : [],
      seasonings: json['seasonings'] != null
          ? List<String>.from((jsonDecode(json['seasonings']) as List))
          : [],
      cookingSteps: json['cooking_steps'] != null
          ? List<String>.from((jsonDecode(json['cooking_steps']) as List))
          : [],
      weightLossIngredients: json['weight_loss_ingredients'],
      taste: json['taste'],
      calorie: json['calorie'],
      nutrients: json['nutrients'] != null
          ? Map<String, dynamic>.from(jsonDecode(json['nutrients']))
          : null,
      isDelicious: json['is_delicious'] == 1,
      status: json['status'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  /// 将 Dish 实例转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uuid': uuid,
      'name': name,
      'ingredients': ingredients != null ? jsonEncode(ingredients) : null,
      'seasonings': seasonings != null ? jsonEncode(seasonings) : null,
      'cooking_steps': cookingSteps != null ? jsonEncode(cookingSteps) : null,
      'weight_loss_ingredients': weightLossIngredients,
      'taste': taste,
      'calorie': calorie,
      'nutrients': nutrients != null ? jsonEncode(nutrients) : null,
      'is_delicious': isDelicious == true ? 1 : 0,
      'status': status,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
