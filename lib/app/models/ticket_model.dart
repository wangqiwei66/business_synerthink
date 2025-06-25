class TicketModel {
  String? id;
  String? createAt;
  String? updateAt;
  String? userId;
  String? storeId;
  String? type;
  String? coinPackageId;
  String? orderId;
  int? score;
  String? avatar;
  double? amount;
  double? discountAmount;
  double? realAmount;
  int? quantity;
  String? name;
  String? description;
  String? rules;
  String? prize;
  int? state;
  bool? alwaysEnable;
  String? updateAtStr;
  String? createAtStr;
  String? userEmail;
  String? userName;
  String? redeemAt;
  String? staffName;
  String? storeName;

  TicketModel({
    this.id,
    this.createAt,
    this.updateAt,
    this.userId,
    this.storeId,
    this.type,
    this.coinPackageId,
    this.orderId,
    this.score,
    this.avatar,
    this.amount,
    this.discountAmount,
    this.realAmount,
    this.quantity,
    this.name,
    this.description,
    this.rules,
    this.prize,
    this.state,
    this.alwaysEnable,
    this.updateAtStr,
    this.createAtStr,
    this.userEmail,
    this.userName,
    this.redeemAt,
    this.staffName,
    this.storeName,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) => TicketModel(
        id: json['id'] as String?,
        createAt: json['createAt'] as String?,
        updateAt: json['updateAt'] as String?,
        userId: json['userId'] as String?,
        storeId: json['storeId'] as String?,
        type: json['type'] as String?,
        coinPackageId: json['coinPackageId'] as String?,
        orderId: json['orderId'] as String?,
        score: json['score'] as int?,
        avatar: json['avatar'] as String?,
        amount: json['amount'] as double?,
        discountAmount: json['discountAmount'] as double?,
        realAmount: json['realAmount'] as double?,
        quantity: json['quantity'] as int?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        rules: json['rules'] as String?,
        prize: json['prize'] as String?,
        state: json['state'] as int?,
        alwaysEnable: json['alwaysEnable'] as bool?,
        updateAtStr: json['updateAtStr'] as String?,
        createAtStr: json['createAtStr'] as String?,
        userEmail: json['userEmail'] as String?,
        userName: json['userName'] as String?,
        redeemAt: json['redeemAt'] as String?,
        staffName: json['staffName'] as String?,
        storeName: json['storeName'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'createAt': createAt,
        'updateAt': updateAt,
        'userId': userId,
        'storeId': storeId,
        'type': type,
        'coinPackageId': coinPackageId,
        'orderId': orderId,
        'score': score,
        'avatar': avatar,
        'amount': amount,
        'discountAmount': discountAmount,
        'realAmount': realAmount,
        'quantity': quantity,
        'name': name,
        'description': description,
        'rules': rules,
        'prize': prize,
        'state': state,
        'alwaysEnable': alwaysEnable,
        'updateAtStr': updateAtStr,
        'createAtStr': createAtStr,
        'userEmail': userEmail,
        'userName': userName,
        'redeemAt': redeemAt,
        'staffName': staffName,
        'storeName': storeName,
      };
}
