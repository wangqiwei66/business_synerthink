class FoodDetail {
  String? name;
  double? quantity;
  String? unit;
  int? calories;

  FoodDetail({this.name, this.quantity, this.unit, this.calories});

  @override
  String toString() {
    return 'FoodDetail(name: $name, quantity: $quantity, unit: $unit, calories: $calories)';
  }

  factory FoodDetail.fromJson(Map<String, dynamic> json) => FoodDetail(
        name: json['name'] as String?,
        quantity: json['quantity'] as double?,
        unit: json['unit'] as String?,
        calories: json['calories'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'quantity': quantity,
        'unit': unit,
        'calories': calories,
      };
}
