import 'package:tiny_weight/app/models/security_check_detail_model/customer_address.dart';

class DeliveryOrderModel {
  int? id;
  int? stationId;
  String? stationName;
  int? orderId;
  int? checkId;
  int? courierId;
  int? customerId;
  int? status;
  String? courierName;
  String? customerName;
  String? customerMobile;
  CustomerAddress? customerAddr; // 修改类型为 CustomerAddress?
  List<String>? cylinders;
  int? startTime;
  int? completedTime;
  int? createTime;

  DeliveryOrderModel({
    this.id,
    this.stationId,
    this.stationName,
    this.orderId,
    this.checkId,
    this.courierId,
    this.customerId,
    this.status,
    this.courierName,
    this.customerName,
    this.customerMobile,
    this.customerAddr,
    this.cylinders,
    this.startTime,
    this.completedTime,
    this.createTime,
  });

  factory DeliveryOrderModel.fromJson(Map<String, dynamic> json) {
    return DeliveryOrderModel(
      id: json['id'] as int?,
      stationId: json['stationId'] as int?,
      stationName: json['stationName'] as String?,
      orderId: json['orderId'] as int?,
      checkId: json['checkId'] as int?,
      courierId: json['courierId'] as int?,
      customerId: json['customerId'] as int?,
      status: json['status'] as int?,
      courierName: json['courierName'] as String?,
      customerName: json['customerName'] as String?,
      customerMobile: json['customerMobile'] as String?,
      customerAddr: json['customerAddr'] != null
          ? CustomerAddress.fromJson(
              json['customerAddr'] as Map<String, dynamic>)
          : null,
      cylinders: (json['cylinders'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      startTime: json['startTime'] as int?,
      completedTime: json['completedTime'] as int?,
      createTime: json['createTime'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'stationId': stationId,
        'stationName': stationName,
        'orderId': orderId,
        'checkId': checkId,
        'courierId': courierId,
        'customerId': customerId,
        'status': status,
        'courierName': courierName,
        'customerName': customerName,
        'customerMobile': customerMobile,
        'customerAddr': customerAddr?.toJson(),
        'cylinders': cylinders,
        'startTime': startTime,
        'completedTime': completedTime,
        'createTime': createTime,
      };
}
