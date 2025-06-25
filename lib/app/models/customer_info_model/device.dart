class Device {
  String? type;
  String? style;
  String? brand;
  String? model;

  Device({this.type, this.style, this.brand, this.model});

  factory Device.fromJson(Map<String, dynamic> json) => Device(
        type: json['type'] as String?,
        style: json['style'] as String?,
        brand: json['brand'] as String?,
        model: json['model'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'style': style,
        'brand': brand,
        'model': model,
      };
}
