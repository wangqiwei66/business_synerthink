import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tiny_weight/app/config/path.dart';
import 'package:tiny_weight/app/models/meal_collection_model/meal_collection_model.dart'; // 确保引入路径配置

// 显示食谱详情的 Bottom Sheet
void showRecipeDetailsSheet(BuildContext context, List<Dish> dishes) {
  if (dishes.isEmpty) {
    EasyLoading.showError('没有可显示的食谱详情');
    return;
  }

  // 状态变量
  int selectedIndex = 0; // 默认选中第一个食物

  Get.bottomSheet(
    StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        final selectedDish = dishes[selectedIndex]; // 获取当前选中的食物数据

        return Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.85, // 限制最大高度
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            // 使用 Column 包含所有内容
            mainAxisSize: MainAxisSize.min, // 高度自适应内容
            children: [
              // --- 顶部标题和食物选择区 ---
              Container(
                padding: const EdgeInsets.only(top: 20, bottom: 20), // 调整内边距
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image:
                        AssetImage('${base_img_path}sheet_top_bg.png'), // 背景图
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  // 使用 Column 放置标题和选项卡
                  children: [
                    // const Text( // 固定的标题
                    //   '查看做法',
                    //   style: TextStyle(
                    //     fontSize: 18,
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.black87,
                    //   ),
                    // ),
                    // const SizedBox(height: 15),
                    // 食物选项卡 (横向滚动)
                    SizedBox(
                      height: 35, // 给选项卡一个固定高度
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding:
                            const EdgeInsets.symmetric(horizontal: 16), // 左右留白
                        itemCount: dishes.length,
                        itemBuilder: (ctx, index) {
                          final item = dishes[index];
                          final bool isSelected = index == selectedIndex;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index; // 更新选中的索引
                              });
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              margin: EdgeInsets.only(
                                  right: index == dishes.length - 1
                                      ? 0
                                      : 8), // 最后一项无右边距
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? const Color(0xFF9FE450)
                                    : Colors.white.withOpacity(0.8), // 选中和未选中颜色
                                borderRadius: BorderRadius.circular(18), // 圆角
                                border: Border.all(
                                  // 添加边框以更好地区分未选中项
                                  color: isSelected
                                      ? const Color(0xFF9FE450)
                                      : Colors.grey.shade300,
                                  width: 1,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                item.name ?? '未知食物', // 显示食物名称
                                style: TextStyle(
                                  color: Colors.black87, // 文本颜色
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // --- 食谱详情内容区 (可滚动) ---
              Expanded(
                // 使内容区填充剩余空间并可滚动
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // --- 灰色卡片包裹做法和绿色提示 ---
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                        margin: const EdgeInsets.only(bottom: 24),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF7F8FA),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '材料',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF3E3E3E),
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            if (selectedDish.ingredients is List)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:
                                    (selectedDish.ingredients as List<String>)
                                        .map((entry) => Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 8.0),
                                              child: Text(
                                                entry,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xFF3E3E3E)),
                                              ),
                                            ))
                                        .toList(),
                              )
                            else
                              const Text(
                                '暂无材料说明',
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xFF3E3E3E)),
                              ),
                            const Text(
                              '调料',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF3E3E3E),
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            if (selectedDish.seasonings is List)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:
                                    (selectedDish.seasonings as List<String>)
                                        .map((entry) => Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 8.0),
                                              child: Text(
                                                entry,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xFF3E3E3E)),
                                              ),
                                            ))
                                        .toList(),
                              )
                            else
                              const Text(
                                '暂无调料说明',
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xFF3E3E3E)),
                              ),
                            const Text(
                              '做法',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF3E3E3E),
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            if (selectedDish.cookingSteps is List)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:
                                    (selectedDish.cookingSteps as List<String>)
                                        .map((entry) => Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 8.0),
                                              child: Text(
                                                entry,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xFF3E3E3E)),
                                              ),
                                            ))
                                        .toList(),
                              )
                            else
                              const Text(
                                '暂无做法说明',
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xFF3E3E3E)),
                              ),
                            // 绿色提示
                            if (selectedDish.taste != null &&
                                selectedDish.taste!.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  selectedDish.taste!,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF28D355),
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                          ],
                        ),
                      ),
                      // --- 营养素分布 ---
                      const Text(
                        '该餐营养素分布',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3E3E3E)),
                      ),
                      const SizedBox(height: 10),
                      if (selectedDish.nutrients is Map)
                        Builder(
                          builder: (context) {
                            final nutrientsMap =
                                selectedDish.nutrients as Map<String, dynamic>;
                            final nutrientsList = nutrientsMap['nutrients']
                                    is List
                                ? (nutrientsMap['nutrients'] as List).join('、')
                                : '';
                            final totalCarbs =
                                nutrientsMap['total_carbohydrates'] ?? '';
                            final totalProtein =
                                nutrientsMap['total_protein'] ?? '';
                            final totalFat = nutrientsMap['total_fat'] ?? '';
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '营养素：$nutrientsList',
                                  style: const TextStyle(
                                      fontSize: 14, color: Color(0xFF3E3E3E)),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '碳水合计：$totalCarbs g',
                                  style: const TextStyle(
                                      fontSize: 14, color: Color(0xFF3E3E3E)),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '蛋白质合计：$totalProtein g',
                                  style: const TextStyle(
                                      fontSize: 14, color: Color(0xFF3E3E3E)),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '脂肪合计：$totalFat g',
                                  style: const TextStyle(
                                      fontSize: 14, color: Color(0xFF3E3E3E)),
                                ),
                              ],
                            );
                          },
                        )
                      else
                        const Text(
                          '暂无营养信息',
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
    backgroundColor: Colors.transparent, // 使背景透明，看到圆角效果
    isScrollControlled: true, // 允许 Sheet 高度超过一半屏幕
    // enterBottomSheetDuration: const Duration(milliseconds: 200),
    // exitBottomSheetDuration: const Duration(milliseconds: 200),
  );
}
