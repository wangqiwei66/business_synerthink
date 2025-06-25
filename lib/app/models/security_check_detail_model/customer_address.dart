class CustomerAddress {
  int? type;
  int? streetId;
  String? streetName;
  int? communityId;
  String? communityName;
  String? detailAddr;
  double? longitude;
  double? latitude;

  CustomerAddress({
    this.type,
    this.streetId,
    this.streetName,
    this.communityId,
    this.communityName,
    this.detailAddr,
    this.longitude,
    this.latitude,
  });

  factory CustomerAddress.fromJson(Map<String, dynamic> json) =>
      CustomerAddress(
        type: json['type'] as int?,
        streetId: json['streetId'] as int?,
        streetName: json['streetName'] as String?,
        communityId: json['communityId'] as int?,
        communityName: json['communityName'] as String?,
        detailAddr: json['detailAddr'] as String?,
        longitude: (json['longitude'] as num?)?.toDouble(),
        latitude: (json['latitude'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'streetId': streetId,
        'streetName': streetName,
        'communityId': communityId,
        'communityName': communityName,
        'detailAddr': detailAddr,
        'longitude': longitude,
        'latitude': latitude,
      };
}
