import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

/// 商品数据模型
class ProductModel {
  final String title;
  final String price;
  final String originalPrice;
  final String soldCount;
  final String imageUrl;
  final String category;

  ProductModel({
    required this.title,
    required this.price,
    required this.originalPrice,
    required this.soldCount,
    required this.imageUrl,
    required this.category,
  });
}

/// 用户评价数据模型
class ReviewModel {
  final String userName;
  final String userId;
  final String userAvatar;
  final String productTitle;
  final String productImage;
  final String productPrice;
  final String productCount;
  final String productStatus;
  final String deliveryType;
  final String deliveryAddress;
  final String reviewContent;
  final int productScore;
  final int serviceScore;
  final int logisticsScore;
  final String reviewTime;

  ReviewModel({
    required this.userName,
    required this.userId,
    required this.userAvatar,
    required this.productTitle,
    required this.productImage,
    required this.productPrice,
    required this.productCount,
    required this.productStatus,
    required this.deliveryType,
    required this.deliveryAddress,
    required this.reviewContent,
    required this.productScore,
    required this.serviceScore,
    required this.logisticsScore,
    required this.reviewTime,
  });
}

/// 预览商店页面逻辑控制器
class PreviewShopLogic extends GetxController {
  // 商店信息
  final storeName = 'TAYLOR STORE';
  final storeCategory = '電子及電腦科技';
  final storePhone = '6661 2227'.obs;
  final storeAddress = '九龍深水埗福華街146-152號黃金電腦商場地面54號舖'.obs;

  // 商店标签
  final storeTags = <String>['家居生活', '智能產品', '家庭電器', '資訊科技'].obs;

  // 用户信息
  final userName = 'CHAN TAI MAN, TAYLOR'.obs;
  final organizationName = '所屬組織名稱'.obs;
  final branchName = '所屬分會名稱'.obs;

  // 商品列表数据
  final products = <ProductModel>[
    ProductModel(
      title: '[商品] 商品標題欄，限制文字30字元以內，超出...',
      price: '9,999',
      originalPrice: 'HKD 9,999',
      soldCount: '已售 999+',
      imageUrl: 'assets/img/meal1.jpg',
      category: 'LIVING ROOM',
    ),
    ProductModel(
      title: '[商品] 商品標題欄，限制文字30字元以內，超出...',
      price: '9,999',
      originalPrice: 'HKD 9,999',
      soldCount: '已售 999+',
      imageUrl: 'assets/img/meal2.jpg',
      category: 'LIVING ROOM',
    ),
    ProductModel(
      title: '[商品] 商品標題欄，限制文字30字元以內，超出...',
      price: '9,999',
      originalPrice: 'HKD 9,999',
      soldCount: '已售 999+',
      imageUrl: 'assets/img/meal3.jpg',
      category: 'LIVING ROOM',
    ),
    ProductModel(
      title: '[商品] 商品標題欄，限制文字30字元以內，超出...',
      price: '9,999',
      originalPrice: 'HKD 9,999',
      soldCount: '已售 999+',
      imageUrl: 'assets/img/meal1.jpg',
      category: 'LIVING ROOM',
    ),
    ProductModel(
      title: '[商品] 商品標題欄，限制文字30字元以內，超出...',
      price: '9,999',
      originalPrice: 'HKD 9,999',
      soldCount: '已售 999+',
      imageUrl: 'assets/img/meal2.jpg',
      category: 'LIVING ROOM',
    ),
    ProductModel(
      title: '[商品] 商品標題欄，限制文字30字元以內，超出...',
      price: '9,999',
      originalPrice: 'HKD 9,999',
      soldCount: '已售 999+',
      imageUrl: 'assets/img/meal3.jpg',
      category: 'LIVING ROOM',
    ),
  ].obs;

  // 子商城商品列表数据
  final subStoreProducts = <ProductModel>[
    ProductModel(
      title: '[商品] 商品標題欄，限制文字30字元以內，超出...',
      price: '9,999',
      originalPrice: 'HKD 9,999',
      soldCount: '已售 999+',
      imageUrl: 'assets/img/meal1.jpg',
      category: 'LIVING ROOM',
    ),
    ProductModel(
      title: '[商品] 商品標題欄，限制文字30字元以內，超出...',
      price: '9,999',
      originalPrice: 'HKD 9,999',
      soldCount: '已售 999+',
      imageUrl: 'assets/img/meal2.jpg',
      category: 'LIVING ROOM',
    ),
    ProductModel(
      title: '[商品] 商品標題欄，限制文字30字元以內，超出...',
      price: '9,999',
      originalPrice: 'HKD 9,999',
      soldCount: '已售 999+',
      imageUrl: 'assets/img/meal3.jpg',
      category: 'LIVING ROOM',
    ),
    ProductModel(
      title: '[商品] 商品標題欄，限制文字30字元以內，超出...',
      price: '9,999',
      originalPrice: 'HKD 9,999',
      soldCount: '已售 999+',
      imageUrl: 'assets/img/meal1.jpg',
      category: 'LIVING ROOM',
    ),
    ProductModel(
      title: '[商品] 商品標題欄，限制文字30字元以內，超出...',
      price: '9,999',
      originalPrice: 'HKD 9,999',
      soldCount: '已售 999+',
      imageUrl: 'assets/img/meal2.jpg',
      category: 'LIVING ROOM',
    ),
    ProductModel(
      title: '[商品] 商品標題欄，限制文字30字元以內，超出...',
      price: '9,999',
      originalPrice: 'HKD 9,999',
      soldCount: '已售 999+',
      imageUrl: 'assets/img/meal3.jpg',
      category: 'LIVING ROOM',
    ),
  ].obs;

  // 用户评价 mock 数据
  final reviews = <ReviewModel>[
    ReviewModel(
      userName: 'CHAN SIU MAN, CHRISTINA',
      userId: 'CHAN SIU MAN, CHRISTINA',
      userAvatar: 'assets/img/about_me_icon.png',
      productTitle: '[展示] 商品標題欄，限制文字30字元以內，超出字數系統自動隱藏多',
      productImage: 'assets/img/meal1.jpg',
      productPrice: 'HKD 9,999',
      productCount: '10',
      productStatus: '已確認收貨',
      deliveryType: '送貨上門',
      deliveryAddress: '香港九龍深水埗北京道1號12樓08室',
      reviewContent:
          'R已250字元。R已250字元。R已250字元。R已250字元。R已250字元。R已250字元。R已250字元。R已250字元。R已250字元。R已250字元。',
      productScore: 4,
      serviceScore: 5,
      logisticsScore: 5,
      reviewTime: '2025-06-29',
    ),
    ReviewModel(
      userName: '用戶#F33669980',
      userId: 'F33669980',
      userAvatar: 'assets/img/about_me_icon.png',
      productTitle: '[展示] 商品標題欄，限制文字30字元以內，超出字數系統自動隱藏多',
      productImage: 'assets/img/meal2.jpg',
      productPrice: 'HKD 9,999',
      productCount: '10',
      productStatus: '已確認收貨',
      deliveryType: '自提點取',
      deliveryAddress: '香港九龍深水埗北京道1號12樓08室',
      reviewContent:
          'R已250字元。R已250字元。R已250字元。R已250字元。R已250字元。R已250字元。R已250字元。R已250字元。R已250字元。R已250字元。',
      productScore: 5,
      serviceScore: 4,
      logisticsScore: 5,
      reviewTime: '2025-06-28',
    ),
  ].obs;

  // 按钮点击事件
  void onContactButtonPressed() {
    Get.snackbar('聯絡', '聯絡賣家功能待實現');
  }

  void onReviewButtonPressed() {
    Get.snackbar('瀏覽', '瀏覽賣家商品功能待實現');
  }

  /// 商品点击事件
  void onProductTap(ProductModel product) {
    EasyLoading.showInfo('點擊了商品: ${product.title}');
  }
}
