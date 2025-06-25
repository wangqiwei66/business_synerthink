class DictModel {
  String? dictType;
  String? value;
  String? label;
  String? colorType;
  String? cssClass;

  DictModel({
    this.dictType,
    this.value,
    this.label,
    this.colorType,
    this.cssClass,
  });

  factory DictModel.fromJson(Map<String, dynamic> json) => DictModel(
        dictType: json['dictType'] as String?,
        value: json['value'] as String?,
        label: json['label'] as String?,
        colorType: json['colorType'] as String?,
        cssClass: json['cssClass'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'dictType': dictType,
        'value': value,
        'label': label,
        'colorType': colorType,
        'cssClass': cssClass,
      };
}
