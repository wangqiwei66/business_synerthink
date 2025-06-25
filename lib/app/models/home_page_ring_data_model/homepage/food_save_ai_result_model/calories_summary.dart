class CaloriesSummary {
  int? planCalories;
  int? intakedCalories;
  int? remainingCalories;
  dynamic tag;

  CaloriesSummary({
    this.planCalories,
    this.intakedCalories,
    this.remainingCalories,
    this.tag,
  });

  @override
  String toString() {
    return 'CaloriesSummary(planCalories: $planCalories, intakedCalories: $intakedCalories, remainingCalories: $remainingCalories, tag: $tag)';
  }

  factory CaloriesSummary.fromJson(Map<String, dynamic> json) {
    return CaloriesSummary(
      planCalories: json['plan_calories'] as int?,
      intakedCalories: json['intaked_calories'] as int?,
      remainingCalories: json['remaining_calories'] as int?,
      tag: json['tag'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
        'plan_calories': planCalories,
        'intaked_calories': intakedCalories,
        'remaining_calories': remainingCalories,
        'tag': tag,
      };
}
