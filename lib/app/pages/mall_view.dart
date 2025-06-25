import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiny_weight/app/widgets/scalable.dart';
import 'mall_logic.dart';

class MallView extends StatelessWidget {
  MallView({super.key});
  final logic = Get.put(MallLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 头部用户信息
            _buildHeaderView(),
            // 組織推薦
            _buildOrganizeRecommendView(),
            // 快捷功能
            _buildItems(),
            // 收費廣告欄
            _buildAds(),
            // 小广告栏
            _buildAds2(),
            // 為你推薦
            _buildRecomendForYouView(),
            // 推荐商品九宫格
            _buildRecomendForYouProductsView(),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Padding _buildAds2() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: logic.adImages
            .map((img) => Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: AssetImage(img), fit: BoxFit.cover),
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        color: Colors.black54,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 2),
                        child: const Text('收費廣告欄',
                            style:
                                TextStyle(color: Colors.amber, fontSize: 12)),
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }

  Padding _buildRecomendForYouProductsView() {
    final images = logic.recommendImages;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (images.isEmpty) return const SizedBox();

          const double spacing = 8;
          final double cellSize = (constraints.maxWidth - spacing * 3) / 4;
          final double largeCellSize = cellSize * 2 + spacing;

          List<Widget> children = [];

          // Large 2x2 image
          if (images.isNotEmpty) {
            children.add(Positioned(
              left: 0,
              top: 0,
              child: ScalableWell(
                onTap: () {
                  Get.log('First image tapped');
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    images[0],
                    width: largeCellSize,
                    height: largeCellSize,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ));
          }

          // Top-right 4 images (2x2 small blocks)
          for (int i = 1; i <= 4; i++) {
            if (i >= images.length) break;
            int localIndex = i - 1;
            int row = localIndex ~/ 2;
            int col = localIndex % 2;

            final dx = largeCellSize + spacing + col * (cellSize + spacing);
            final dy = row * (cellSize + spacing);

            children.add(Positioned(
              left: dx,
              top: dy,
              child: ScalableWell(
                onTap: () {
                  Get.log('Image $i tapped');
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    images[i],
                    width: cellSize,
                    height: cellSize,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ));
          }

          // From index 4 onwards, display in grid (start at row 2)
          for (int i = 5; i < images.length; i++) {
            int gridIndex = i - 5;
            int row = gridIndex ~/ 4 + 2; // start from row 2
            int col = gridIndex % 4;

            final dx = col * (cellSize + spacing);
            final dy = row * (cellSize + spacing);

            children.add(Positioned(
              left: dx.toDouble(),
              top: dy.toDouble(),
              child: ScalableWell(
                onTap: () {
                  Get.log('Image $i tapped');
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    images[i],
                    width: cellSize,
                    height: cellSize,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ));
          }

          // Total height
          int restCount = (images.length - 4).clamp(0, images.length);
          int restRows = (restCount / 4).ceil();
          int totalRows = 2 + restRows; // first two rows (big + top 3) + others
          double height = totalRows * cellSize + (totalRows - 1) * spacing;

          return SizedBox(
            height: height,
            child: Stack(children: children),
          );
        },
      ),
    );
  }

  Padding _buildRecomendForYouView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          RichText(
              text: const TextSpan(
            text: '為你',
            style: TextStyle(
                color: Colors.pink, fontWeight: FontWeight.bold, fontSize: 20),
            children: [
              TextSpan(
                text: '推薦',
                style: TextStyle(color: Colors.purple, fontSize: 20),
              ),
            ],
          )),
          const SizedBox(width: 16),
          Expanded(
            child: SizedBox(
              height: 22,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: logic.recommendCategories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, i) => Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                  decoration: BoxDecoration(
                    color: Colors.purple[100],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      logic.recommendCategories[i],
                      style:
                          const TextStyle(color: Colors.black87, fontSize: 12),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildAds() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blueAccent, width: 2),
        ),
        child: Row(
          children: [
            Container(
              width: 120,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              alignment: Alignment.center,
              child: RichText(
                  text: const TextSpan(
                text: '收費',
                style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                children: [
                  TextSpan(
                      text: '廣告欄',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              )),
            ),
            Expanded(
              child: Image.asset('assets/img/banner1.jpg', fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildItems() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: logic.quickActions
            .map((action) => Column(
                  children: [
                    Icon(action['icon'], color: Colors.black87, size: 36),
                    const SizedBox(height: 4),
                    Text(action['label'], style: const TextStyle(fontSize: 14)),
                  ],
                ))
            .toList(),
      ),
    );
  }

  Padding _buildOrganizeRecommendView() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.pink[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text('組織\n推薦',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: SizedBox(
              height: 60,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: logic.regionImages.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, i) => ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    children: [
                      Image.asset(logic.regionImages[i],
                          width: 100, height: 60, fit: BoxFit.cover),
                      Positioned(
                        right: 6,
                        bottom: 4,
                        child: Container(
                          color: Colors.black54,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 2),
                          child: Text(
                            logic.regions[i],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildHeaderView() {
    return Container(
      color: Colors.black87,
      padding: const EdgeInsets.fromLTRB(
          16, 36, 16, 16), // symmetric(horizontal: 16, vertical: 36),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 32,
            backgroundImage: AssetImage('assets/img/about_me_icon.png'),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Text(
                      logic.userName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.diamond, color: Colors.white, size: 20),
                  ],
                ),
                // const SizedBox(height: 4),
                const Row(
                  children: [
                    Text('組織名稱', style: TextStyle(color: Colors.white70)),
                    SizedBox(width: 8),
                    Text('分會名稱', style: TextStyle(color: Colors.white70)),
                    SizedBox(width: 8),
                    Text('等級 1', style: TextStyle(color: Colors.white70)),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text('積分：${logic.points}',
                        style: const TextStyle(color: Colors.white70)),
                    const SizedBox(width: 8),
                    Text('貢獻：${logic.contribution}',
                        style: const TextStyle(color: Colors.white70)),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              IconButton(
                icon: const Icon(Icons.keyboard_control,
                    color: Colors.pinkAccent),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.mail_outline, color: Colors.pinkAccent),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
