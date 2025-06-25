class TotalFat {
  double? value;
  dynamic tag;

  TotalFat({this.value, this.tag});

  @override
  String toString() => 'TotalFat(value: $value, tag: $tag)';

  factory TotalFat.fromJson(Map<String, dynamic> json) => TotalFat(
        value: (json['value'] as num?)?.toDouble(),
        tag: json['tag'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'value': value,
        'tag': tag,
      };
}
