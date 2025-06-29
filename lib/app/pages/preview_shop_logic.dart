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

  // 按钮点击事件
  void onContactButtonPressed() {
    Get.snackbar('聯絡', '聯絡賣家功能待實現');
  }

  void onReviewButtonPressed() {
    Get.snackbar('瀏覽', '瀏覽賣家商品功能待實現');
  }

  /// 商品点击事件
  void onProductTap(ProductModel product) {
    Get.snackbar('商品', '點擊了商品: ${product.title}');
  }
}
