import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'preview_shop_logic.dart';
import 'userinfo_view.dart';

/// 预览商店页面
class PreviewShopView extends StatelessWidget {
  const PreviewShopView({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(PreviewShopLogic());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 顶部用户信息区域
            const UserInfoView(),
            // 商店信息卡片
            _buildStoreInfoCard(logic),

            const SizedBox(height: 4),

            const Padding(
              padding: EdgeInsets.all(14.0),
              child: Row(
                children: [
                  Text(
                    '我的賣家訊息',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            // 我的賣家訊息卡片
            _buildSellerInfoCard(logic),

            const SizedBox(height: 12),

            // 我的商品部分
            _buildMyProductsSection(logic),

            const SizedBox(height: 12),

            // 子商城商品部分
            _buildSubStoreProductsSection(logic),
          ],
        ),
      ),
    );
  }

  /// 构建商店信息卡片
  Widget _buildStoreInfoCard(PreviewShopLogic logic) {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // 商店头像
              Container(
                width: 94,
                height: 94,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  image: const DecorationImage(
                    image: AssetImage('assets/img/about_me_icon.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),

              // 商店信息
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          logic.storeName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          // decoration: BoxDecoration(
                          //   color: Colors.blue.shade100,
                          //   borderRadius: BorderRadius.circular(12),
                          // ),
                          child: Text(
                            logic.storeCategory,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue.shade700,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 12),
                    // 商店标签
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: logic.storeTags
                          .map((tag) => Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 0),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF9747FF),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  tag,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      '電話：${logic.storePhone.value}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      '地址：${logic.storeAddress.value}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }

  /// 构建我的賣家訊息卡片
  Widget _buildSellerInfoCard(PreviewShopLogic logic) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // 用户头像
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(
                    image: AssetImage('assets/img/about_me_icon.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),

              // 用户信息
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() => Text(
                          logic.userName.value,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/img/org_icon.png',
                                    width: 20,
                                    height: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Obx(() => Text(
                                        logic.organizationName.value,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF616161),
                                        ),
                                      )),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/img/sub_icon.png',
                                    width: 20,
                                    height: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Obx(() => Text(
                                        logic.branchName.value,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF616161),
                                        ),
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/img/contact_icon.png',
                              width: 55,
                              height: 30,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Image.asset(
                              'assets/img/browser_icon.png',
                              width: 65,
                              height: 30,
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 构建我的商品部分
  Widget _buildMyProductsSection(PreviewShopLogic logic) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 标题栏
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                '我的商品',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              GestureDetector(
                onTap: () {
                  EasyLoading.showInfo('管理商品功能待實現');
                },
                child: const Text(
                  '管理商品>>',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF004DA1),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          // 商品网格 (3列2行)

          GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 12),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.7,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
            ),
            itemCount: logic.products.length > 6 ? 6 : logic.products.length,
            itemBuilder: (context, index) {
              final product = logic.products[index];
              return _buildProductCard(product, logic);
            },
          ),
        ],
      ),
    );
  }

  /// 构建单个商品卡片
  Widget _buildProductCard(ProductModel product, PreviewShopLogic logic) {
    return GestureDetector(
      onTap: () => logic.onProductTap(product),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.1),
          //     blurRadius: 4,
          //     offset: const Offset(0, 2),
          //   ),
          // ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 商品图片和分类标签
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  // 商品图片
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                      image: DecorationImage(
                        image: AssetImage(product.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // 分类标签
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        product.category,
                        style: const TextStyle(
                          fontSize: 8,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 商品信息
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 商品标题
                    Text(
                      product.title,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.black87,
                        height: 1.2,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const Spacer(),

                    // 价格和销量
                    Row(
                      children: [
                        // 价格
                        Text(
                          product.price,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.pink,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        // 销量
                        Text(
                          product.soldCount,
                          style: const TextStyle(
                            fontSize: 8,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 2),

                    // // 原价
                    // Text(
                    //   product.originalPrice,
                    //   style: const TextStyle(
                    //     fontSize: 8,
                    //     color: Colors.grey,
                    //     decoration: TextDecoration.lineThrough,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 构建子商城商品部分
  Widget _buildSubStoreProductsSection(PreviewShopLogic logic) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 标题栏
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                '子商城商品',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              GestureDetector(
                onTap: () {
                  EasyLoading.showInfo('管理商品功能待實現');
                },
                child: const Text(
                  '管理商品>>',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF004DA1),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          // 商品网格 (3列2行)
          GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 12),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.7,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
            ),
            itemCount: logic.subStoreProducts.length > 6
                ? 6
                : logic.subStoreProducts.length,
            itemBuilder: (context, index) {
              final product = logic.subStoreProducts[index];
              return _buildProductCard(product, logic);
            },
          ),
        ],
      ),
    );
  }
}
