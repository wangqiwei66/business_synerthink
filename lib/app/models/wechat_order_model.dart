/// 微信下单返回数据模型
class WechatOrderModel {
  final String prepayId;
  final String orderNo;
  final String partnerId;
  final String nonceStr;
  final int timeStamp;
  final String sign;

  WechatOrderModel({
    required this.prepayId,
    required this.orderNo,
    required this.partnerId,
    required this.nonceStr,
    required this.timeStamp,
    required this.sign,
  });

  factory WechatOrderModel.fromJson(Map<String, dynamic> json) {
    return WechatOrderModel(
      prepayId: json['prepay_Id'] ?? '',
      orderNo: json['order_no'] ?? '',
      partnerId: json['partner_id'] ?? '',
      nonceStr: json['nonce_str'] ?? '',
      timeStamp: json['time_stamp'] ?? 0,
      sign: json['sign'] ?? '',
    );
  }
}
