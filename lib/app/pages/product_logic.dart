import 'package:get/get.dart';

class ProductLogic extends GetxController {
  // 示例数据
  final productImages = [
    'assets/img/product1.png',
    'assets/img/product2.png',
    'assets/img/product3.png',
    'assets/img/product4.png',
  ];
  final productName = '商品名稱'.obs;
  final productPrice = '¥199.00'.obs;
  final productDesc = '這裡是商品描述，支持多行顯示，內容豐富。'.obs;
  final productTags = ['新品', '熱賣', '包郵'].obs;
  final isFavorite = false.obs;

  void toggleFavorite() => isFavorite.value = !isFavorite.value;
}
