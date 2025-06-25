class PlanInfo {
  final String title;
  final List<PlanItem> plan;

  PlanInfo({
    required this.title,
    required this.plan,
  });

  factory PlanInfo.fromJson(Map<String, dynamic> json) {
    return PlanInfo(
      title: json['title'] ?? '',
      plan: (json['plan'] as List<dynamic>)
          .map((item) => PlanItem.fromJson(item))
          .toList(),
    );
  }
}

class PlanItem {
  final String iconUrl;
  final String title;
  final String text;

  PlanItem({
    required this.iconUrl,
    required this.title,
    required this.text,
  });

  factory PlanItem.fromJson(Map<String, dynamic> json) {
    return PlanItem(
      iconUrl: json['icon_url'] ?? '',
      title: json['title'] ?? '',
      text: json['text'] ?? '',
    );
  }
}
