import 'dart:convert';

/// 首页环形图数据模型
class HomePageRingDataModel {
  final int dietTargetCalories; // 饮食目标卡路里
  final int exerciseTargetCalories; // 运动目标卡路里
  final Map<String, DietRingData> dietRing; // 饮食环数据
  final Map<String, ExerciseRingData> exerciseRing; // 运动环数据
  final Jejunitas? jejunitas; // 禁食数据
  final Map<String, ShowRingData>? showRing; // 新增：showRing 字段

  HomePageRingDataModel({
    required this.dietTargetCalories,
    required this.exerciseTargetCalories,
    required this.dietRing,
    required this.exerciseRing,
    required this.jejunitas,
    this.showRing,
  });

  factory HomePageRingDataModel.fromJson(Map<String, dynamic> json) {
    // 解析饮食环数据
    final rawDietRing = json['diet_ring'] as Map<String, dynamic>;
    final Map<String, DietRingData> parsedDietRing = {};
    rawDietRing.forEach((key, value) {
      parsedDietRing[key] =
          DietRingData.fromJson(value as Map<String, dynamic>);
    });

    // 解析运动环数据
    final rawExerciseRing = json['exercise_ring'] as Map<String, dynamic>;
    final Map<String, ExerciseRingData> parsedExerciseRing = {};
    rawExerciseRing.forEach((key, value) {
      parsedExerciseRing[key] =
          ExerciseRingData.fromJson(value as Map<String, dynamic>);
    });

    // 解析 showRing 数据
    Map<String, ShowRingData>? parsedShowRing;
    if (json['show_ring'] != null) {
      parsedShowRing = {};
      (json['show_ring'] as Map<String, dynamic>).forEach((key, value) {
        parsedShowRing![key] =
            ShowRingData.fromJson(value as Map<String, dynamic>);
      });
    }

    return HomePageRingDataModel(
      dietTargetCalories: json['diet_target_calories'] as int,
      exerciseTargetCalories: json['exercise_target_calories'] as int,
      dietRing: parsedDietRing,
      exerciseRing: parsedExerciseRing,
      jejunitas: json['jejunitas'] == null
          ? null
          : Jejunitas.fromJson(json['jejunitas']),
      showRing: parsedShowRing,
    );
  }
}

/// 新增：showRing 的数据模型
class ShowRingData {
  final String title; // 例如 DAY1
  final int targetStatus; // 目标状态

  ShowRingData({
    required this.title,
    required this.targetStatus,
  });

  factory ShowRingData.fromJson(Map<String, dynamic> json) {
    return ShowRingData(
      title: json['title'] as String,
      targetStatus: json['target_status'] as int,
    );
  }
}

/// 饮食环数据
class DietRingData {
  final int actualCalories; // 实际卡路里
  final double completionRate; // 完成率
  final Map<String, int> item; // 各餐饮食数据

  DietRingData({
    required this.actualCalories,
    required this.completionRate,
    required this.item,
  });

  factory DietRingData.fromJson(Map<String, dynamic> json) {
    return DietRingData(
      actualCalories: json['actual_calories'] as int,
      completionRate: (json['completion_rate'] as num).toDouble(),
      item: Map<String, int>.from(json['item'] as Map),
    );
  }
}

/// 运动环数据
class ExerciseRingData {
  final int actualCalories; // 实际消耗卡路里
  final double completionRate; // 完成率
  final Map<String, int> item; // 各运动项目数据

  ExerciseRingData({
    required this.actualCalories,
    required this.completionRate,
    required this.item,
  });

  factory ExerciseRingData.fromJson(Map<String, dynamic> json) {
    return ExerciseRingData(
      actualCalories: json['actual_calories'] as int,
      completionRate: (json['completion_rate'] as num).toDouble(),
      item: Map<String, int>.from(json['item'] as Map),
    );
  }
}

/// 禁食数据
class Jejunitas {
  final int id;
  final String uid;
  final int days;
  final String detail;
  final int status;
  final DateTime createdAt;
  final DateTime updatedAt;

  Jejunitas({
    required this.id,
    required this.uid,
    required this.days,
    required this.detail,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Jejunitas.fromJson(Map<String, dynamic> json) {
    return Jejunitas(
      id: json['id'],
      uid: json['uid'],
      days: json['days'],
      detail: json['detail'],
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

/// 运动记录项
class ExerciseItem {
  final int id;
  final String uid;
  final String originalInput;
  final String exerciseText;
  final List<ExerciseMetaData> metaData;
  final int totalCalories;
  final DateTime recordDate;
  final int status;
  final DateTime createdAt;
  final DateTime updatedAt;

  ExerciseItem({
    required this.id,
    required this.uid,
    required this.originalInput,
    required this.exerciseText,
    required this.metaData,
    required this.totalCalories,
    required this.recordDate,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ExerciseItem.fromJson(Map<String, dynamic> json) {
    return ExerciseItem(
      id: json['id'],
      uid: json['uid'],
      originalInput: json['original_input'],
      exerciseText: json['exercise_text'],
      metaData: (jsonDecode(json['meta_data']) as List)
          .map((item) => ExerciseMetaData.fromJson(item))
          .toList(),
      totalCalories: json['total_calories'],
      recordDate: DateTime.parse(json['record_date']),
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

/// 运动元数据
class ExerciseMetaData {
  final int calories;
  final String exerciseType;
  final String exerciseUnit;
  final num exerciseValue;

  ExerciseMetaData({
    required this.calories,
    required this.exerciseType,
    required this.exerciseUnit,
    required this.exerciseValue,
  });

  factory ExerciseMetaData.fromJson(Map<String, dynamic> json) {
    return ExerciseMetaData(
      calories: json['calories'],
      exerciseType: json['exercise_type'],
      exerciseUnit: json['exercise_unit'],
      exerciseValue: json['exercise_value'],
    );
  }
}
