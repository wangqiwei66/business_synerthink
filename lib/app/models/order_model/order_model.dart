import 'order_detail.dart';
import 'package:tiny_weight/app/models/security_check_detail_model/customer_address.dart';

class OrderModel {
  int? id;
  int? stationId;
  String? stationName;
  int? userId;
  String? userName;
  int? customerId;
  String? customerName;
  String? customerPhone;
  CustomerAddress? customerAddr; // 修改类型为 CustomerAddress?
  double? totalPrice;
  int? paymentChannel;
  String? paymentId;
  int? status;
  int? paymentTime;
  int? refundStatus;
  int? createTime;
  String? remark;
  int? cylinderCount;
  List<OrderDetail>? orderDetails;

  OrderModel({
    this.id,
    this.stationId,
    this.stationName,
    this.userId,
    this.userName,
    this.customerId,
    this.customerName,
    this.customerPhone,
    this.customerAddr,
    this.totalPrice,
    this.paymentChannel,
    this.paymentId,
    this.status,
    this.paymentTime,
    this.refundStatus,
    this.createTime,
    this.remark,
    this.orderDetails,
    this.cylinderCount,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json['id'] as int?,
        stationId: json['stationId'] as int?,
        stationName: json['stationName'] as String?,
        userId: json['userId'] as int?,
        userName: json['userName'] as String?,
        customerId: json['customerId'] as int?,
        customerName: json['customerName'] as String?,
        customerPhone: json['customerPhone'] as String?,
        customerAddr: json['customerAddr'] != null
            ? CustomerAddress.fromJson(
                json['customerAddr'] as Map<String, dynamic>)
            : null,
        totalPrice: json['totalPrice'] as double?,
        paymentChannel: json['paymentChannel'] as int?,
        paymentId: json['paymentId'] as String?,
        status: json['status'] as int?,
        paymentTime: json['paymentTime'] as int?,
        refundStatus: json['refundStatus'] as int?,
        createTime: json['createTime'] as int?,
        remark: json['remark'] as String?,
        cylinderCount: json['cylinderCount'] as int?,
        orderDetails: (json['orderDetails'] as List<dynamic>?)
            ?.map((e) => OrderDetail.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'stationId': stationId,
        'stationName': stationName,
        'userId': userId,
        'userName': userName,
        'customerId': customerId,
        'customerName': customerName,
        'customerPhone': customerPhone,
        'customerAddress': customerAddr?.toJson(),
        'totalPrice': totalPrice,
        'paymentChannel': paymentChannel,
        'paymentId': paymentId,
        'status': status,
        'paymentTime': paymentTime,
        'refundStatus': refundStatus,
        'createTime': createTime,
        'remark': remark,
        'cylinderCount': cylinderCount,
        'orderDetails': orderDetails?.map((e) => e.toJson()).toList(),
      };
}
