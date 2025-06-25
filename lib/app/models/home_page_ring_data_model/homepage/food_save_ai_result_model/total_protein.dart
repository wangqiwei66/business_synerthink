class TotalProtein {
  double? value;
  dynamic tag;

  TotalProtein({this.value, this.tag});

  @override
  String toString() => 'TotalProtein(value: $value, tag: $tag)';

  factory TotalProtein.fromJson(Map<String, dynamic> json) => TotalProtein(
        value: (json['value'] as num?)?.toDouble(),
        tag: json['tag'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'value': value,
        'tag': tag,
      };
}
