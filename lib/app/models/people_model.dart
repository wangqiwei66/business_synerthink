class PeopleModel {
  int? id;
  String? nickname;
  String? email;
  String? mobile;
  int? stationId;
  String? stationName;

  PeopleModel({
    this.id,
    this.nickname,
    this.email,
    this.mobile,
    this.stationId,
    this.stationName,
  });

  factory PeopleModel.fromJson(Map<String, dynamic> json) => PeopleModel(
        id: json['id'] as int?,
        nickname: json['nickname'] as String?,
        email: json['email'] as String?,
        mobile: json['mobile'] as String?,
        stationId: json['stationId'] as int?,
        stationName: json['stationName'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nickname': nickname,
        'email': email,
        'mobile': mobile,
        'stationId': stationId,
        'stationName': stationName,
      };
}
