class RingDatum {
  String? mealType;
  int? calories;

  RingDatum({this.mealType, this.calories});

  @override
  String toString() => 'RingDatum(mealType: $mealType, calories: $calories)';

  factory RingDatum.fromJson(Map<String, dynamic> json) => RingDatum(
        mealType: json['meal_type'] as String?,
        calories: json['calories'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'meal_type': mealType,
        'calories': calories,
      };
}
