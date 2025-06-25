class AINutritionSummary {
  List<dynamic>? nutrients;
  double? totalFat;
  double? totalProtein;
  double? totalCarbohydrates;
  int? totalCalories;

  AINutritionSummary({
    this.nutrients,
    this.totalFat,
    this.totalProtein,
    this.totalCarbohydrates,
    required this.totalCalories,
  });

  @override
  String toString() {
    return 'NutritionSummary(nutrients: $nutrients, totalFat: $totalFat, totalProtein: $totalProtein, totalCarbohydrates: $totalCarbohydrates)';
  }

  factory AINutritionSummary.fromJson(Map<String, dynamic> json) {
    return AINutritionSummary(
      nutrients: json['nutrients'] as List<dynamic>?,
      totalFat: json['total_fat'] as double?,
      totalProtein: json['total_protein'] as double?,
      totalCarbohydrates: json['total_carbohydrates'] as double?,
      totalCalories: json['total_calories'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'nutrients': nutrients,
        'total_fat': totalFat,
        'total_protein': totalProtein,
        'total_carbohydrates': totalCarbohydrates,
        'total_calories': totalCalories,
      };
}
