import 'package:tiny_weight/app/models/security_check_detail_model/customer_address.dart';

class SecurityCheckItemModel {
  int? id;
  int? checkTime;
  String? remark;
  String? signSnap;
  int? status;
  bool? isHazardPresent;
  int? createTime;
  int? stationId;
  String? stationName;
  int? workerId;
  String? workerName;
  int? customerId;
  String? customerName;
  String? customerPhone;
  CustomerAddress? customerAddr;
  int? customerType;
  String? streetName;
  String? communityName;

  SecurityCheckItemModel({
    this.id,
    this.checkTime,
    this.remark,
    this.signSnap,
    this.status,
    this.isHazardPresent,
    this.createTime,
    this.stationId,
    this.stationName,
    this.workerId,
    this.workerName,
    this.customerId,
    this.customerName,
    this.customerPhone,
    this.customerAddr,
    this.customerType,
    this.streetName,
    this.communityName,
  });

  factory SecurityCheckItemModel.fromJson(Map<String, dynamic> json) {
    return SecurityCheckItemModel(
      id: json['id'] as int?,
      checkTime: json['checkTime'] as int?,
      remark: json['remark'] as String?,
      signSnap: json['signSnap'] as String?,
      status: json['status'] as int?,
      isHazardPresent: json['isHazardPresent'] as bool?,
      createTime: json['createTime'] as int?,
      stationId: json['stationId'] as int?,
      stationName: json['stationName'] as String?,
      workerId: json['workerId'] as int?,
      workerName: json['workerName'] as String?,
      customerId: json['customerId'] as int?,
      customerName: json['customerName'] as String?,
      customerPhone: json['customerPhone'] as String?,
      customerAddr: json['customerAddr'] != null
          ? CustomerAddress.fromJson(
              json['customerAddr'] as Map<String, dynamic>)
          : null,
      customerType: json['customerType'] as int?,
      streetName: json['streetName'] as String?,
      communityName: json['communityName'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'checkTime': checkTime,
        'remark': remark,
        'signSnap': signSnap,
        'status': status,
        'isHazardPresent': isHazardPresent,
        'createTime': createTime,
        'stationId': stationId,
        'stationName': stationName,
        'workerId': workerId,
        'workerName': workerName,
        'customerId': customerId,
        'customerName': customerName,
        'customerPhone': customerPhone,
        'customerAddress': customerAddr?.toJson(),
        'customerType': customerType,
        'streetName': streetName,
        'communityName': communityName,
      };
}
