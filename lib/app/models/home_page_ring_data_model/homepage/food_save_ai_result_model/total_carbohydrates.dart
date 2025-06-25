class TotalCarbohydrates {
  double? value;
  dynamic tag;

  TotalCarbohydrates({this.value, this.tag});

  @override
  String toString() => 'TotalCarbohydrates(value: $value, tag: $tag)';

  factory TotalCarbohydrates.fromJson(Map<String, dynamic> json) {
    return TotalCarbohydrates(
      value: (json['value'] as num?)?.toDouble(),
      tag: json['tag'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
        'value': value,
        'tag': tag,
      };
}
