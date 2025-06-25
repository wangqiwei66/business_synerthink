/// 每日食谱卡片模型
class DailyDietCardModel {
  final int id;
  final String uuid;
  final String name;
  final String description;
  final String coverImage;
  final int isDelicious;
  final int isWeightLoss;
  final int isDefault;
  final int selectedCount;
  final int sort;
  final String remark;
  final int? maxCalories; // 新增最大卡路里
  final int? minCalories; // 新增最小卡路里
  final int status;
  final String createdAt;
  final String updatedAt;
  final bool selected;
  final bool isNew;

  DailyDietCardModel({
    required this.id,
    required this.uuid,
    required this.name,
    required this.description,
    required this.coverImage,
    required this.isDelicious,
    required this.isWeightLoss,
    required this.isDefault,
    required this.selectedCount,
    required this.sort,
    required this.remark,
    required this.maxCalories,
    required this.minCalories,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.selected,
    required this.isNew,
  });

  /// JSON 解析工厂方法
  factory DailyDietCardModel.fromJson(Map<String, dynamic> json) {
    return DailyDietCardModel(
      id: json['id'] ?? 0,
      uuid: json['uuid'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      coverImage: json['cover_image'] ?? '',
      isDelicious: json['is_delicious'] ?? 0,
      isWeightLoss: json['is_weight_loss'] ?? 0,
      isDefault: json['is_default'] ?? 0,
      selectedCount: json['selected_count'] ?? 0,
      sort: json['sort'] ?? 0,
      remark: json['remark'] ?? '',
      maxCalories: json['max_calories'],
      minCalories: json['min_calories'],
      status: json['status'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      selected: json['selected'] ?? false,
      isNew: json['is_new'] ?? false,
    );
  }
}
