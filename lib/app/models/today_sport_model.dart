/// 今日运动模型，适配后端返回的 JSON 结构
class TodaySportModel {
  final int id; // 运动ID
  final String uuid; // 运动唯一标识
  final String sportName; // 运动名称
  final String sportDesc; // 运动描述
  final int targetArea; // 目标区域
  final int targetGoal; // 目标目标
  final double calories; // 消耗卡路里
  final int minBmi; // 最小BMI
  final int maxBmi; // 最大BMI
  final String remark; // 备注
  final int status; // 状态
  final String createdAt; // 创建时间
  final String updatedAt; // 更新时间
  final int needTime; // 需要时间
  final String burnCalorie; // 消耗热量描述
  final String effect; // 运动效果

  TodaySportModel({
    required this.id,
    required this.uuid,
    required this.sportName,
    required this.sportDesc,
    required this.targetArea,
    required this.targetGoal,
    required this.calories,
    required this.minBmi,
    required this.maxBmi,
    required this.remark,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.needTime,
    required this.burnCalorie,
    required this.effect,
  });

  /// 从 JSON 构造 TodaySportModel
  factory TodaySportModel.fromJson(Map<String, dynamic> json) {
    return TodaySportModel(
      id: json['id'] ?? 0,
      uuid: json['uuid'] ?? '',
      sportName: json['sport_name'] ?? '',
      sportDesc: json['sport_desc'] ?? '',
      targetArea: json['target_area'] ?? 0,
      targetGoal: json['target_goal'] ?? 0,
      calories: (json['calories'] is int)
          ? (json['calories'] as int).toDouble()
          : (json['calories'] ?? 0.0),
      minBmi: json['min_bmi'] ?? 0,
      maxBmi: json['max_bmi'] ?? 0,
      remark: json['remark'] ?? '',
      status: json['status'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      needTime: json['need_time'] ?? 0,
      burnCalorie: json['burn_calorie'] ?? '',
      effect: json['effect'] ?? '',
    );
  }

  /// 转为 JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uuid': uuid,
      'sport_name': sportName,
      'sport_desc': sportDesc,
      'target_area': targetArea,
      'target_goal': targetGoal,
      'calories': calories,
      'min_bmi': minBmi,
      'max_bmi': maxBmi,
      'remark': remark,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'need_time': needTime,
      'burn_calorie': burnCalorie,
      'effect': effect,
    };
  }
}
