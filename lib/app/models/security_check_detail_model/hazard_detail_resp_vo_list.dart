class HazardDetailRespVoList {
  int? createTime;
  int? updateTime;
  String? creator;
  String? updater;
  bool? deleted;
  int? id;
  List<dynamic>? hazardImage;
  String? remark;
  int? rectificationTime;
  List<String>? rectificationImage;
  bool? rectificationStatus;
  bool? assignStatus;
  String? signSnap;
  int? stationId;
  int? checkId;
  int? checkItemId;
  int? hazardId;
  int? workerId;
  int? correctorId;
  int? customerId;
  int? streetId;
  int? communityId;
  String? checkItemName;
  String? hazardName;

  HazardDetailRespVoList({
    this.createTime,
    this.updateTime,
    this.creator,
    this.updater,
    this.deleted,
    this.id,
    this.hazardImage,
    this.remark,
    this.rectificationTime,
    this.rectificationImage,
    this.rectificationStatus,
    this.assignStatus,
    this.signSnap,
    this.stationId,
    this.checkId,
    this.checkItemId,
    this.hazardId,
    this.workerId,
    this.correctorId,
    this.customerId,
    this.streetId,
    this.communityId,
    this.checkItemName,
    this.hazardName,
  });

  factory HazardDetailRespVoList.fromJson(Map<String, dynamic> json) {
    return HazardDetailRespVoList(
      createTime: json['createTime'] as int?,
      updateTime: json['updateTime'] as int?,
      creator: json['creator'] as String?,
      updater: json['updater'] as String?,
      deleted: json['deleted'] as bool?,
      id: json['id'] as int?,
      hazardImage: json['hazardImage'] as List<dynamic>?,
      remark: json['remark'] as String?,
      rectificationTime: json['rectificationTime'] as int?,
      rectificationImage: (json['rectificationImage'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      rectificationStatus: json['rectificationStatus'] as bool?,
      assignStatus: json['assignStatus'] as bool?,
      signSnap: json['signSnap'] as String?,
      stationId: json['stationId'] as int?,
      checkId: json['checkId'] as int?,
      checkItemId: json['checkItemId'] as int?,
      hazardId: json['hazardId'] as int?,
      workerId: json['workerId'] as int?,
      correctorId: json['correctorId'] as int?,
      customerId: json['customerId'] as int?,
      streetId: json['streetId'] as int?,
      communityId: json['communityId'] as int?,
      checkItemName: json['checkItemName'] as String?,
      hazardName: json['hazardName'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'createTime': createTime,
        'updateTime': updateTime,
        'creator': creator,
        'updater': updater,
        'deleted': deleted,
        'id': id,
        'hazardImage': hazardImage,
        'remark': remark,
        'rectificationTime': rectificationTime,
        'rectificationImage': rectificationImage,
        'rectificationStatus': rectificationStatus,
        'assignStatus': assignStatus,
        'signSnap': signSnap,
        'stationId': stationId,
        'checkId': checkId,
        'checkItemId': checkItemId,
        'hazardId': hazardId,
        'workerId': workerId,
        'correctorId': correctorId,
        'customerId': customerId,
        'streetId': streetId,
        'communityId': communityId,
        'checkItemName': checkItemName,
        'hazardName': hazardName,
      };
}
