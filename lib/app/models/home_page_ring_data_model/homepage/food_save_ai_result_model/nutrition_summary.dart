import 'total_carbohydrates.dart';
import 'total_fat.dart';
import 'total_protein.dart';

class NutritionSummary {
  List<dynamic>? nutrients;
  TotalFat? totalFat;
  TotalProtein? totalProtein;
  TotalCarbohydrates? totalCarbohydrates;

  NutritionSummary({
    this.nutrients,
    this.totalFat,
    this.totalProtein,
    this.totalCarbohydrates,
  });

  @override
  String toString() {
    return 'NutritionSummary(nutrients: $nutrients, totalFat: $totalFat, totalProtein: $totalProtein, totalCarbohydrates: $totalCarbohydrates)';
  }

  factory NutritionSummary.fromJson(Map<String, dynamic> json) {
    return NutritionSummary(
      nutrients: json['nutrients'] as List<dynamic>?,
      totalFat: json['total_fat'] == null
          ? null
          : TotalFat.fromJson(json['total_fat'] as Map<String, dynamic>),
      totalProtein: json['total_protein'] == null
          ? null
          : TotalProtein.fromJson(
              json['total_protein'] as Map<String, dynamic>),
      totalCarbohydrates: json['total_carbohydrates'] == null
          ? null
          : TotalCarbohydrates.fromJson(
              json['total_carbohydrates'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'nutrients': nutrients,
        'total_fat': totalFat?.toJson(),
        'total_protein': totalProtein?.toJson(),
        'total_carbohydrates': totalCarbohydrates?.toJson(),
      };
}
