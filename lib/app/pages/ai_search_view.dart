import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ai_search_logic.dart';

class AiSearchView extends StatelessWidget {
  AiSearchView({super.key});
  final logic = Get.put(AiSearchLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: Column(
        children: [
          _buildHeader(),
          _buildSearchTabs(),
          _buildChatList(),
          _buildBottomActions(),
          _buildInputBar(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x33000000), // 深色阴影
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.only(top: 36, left: 0, right: 0, bottom: 8),
      margin: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          const SizedBox(width: 16),
          const Icon(Icons.home, color: Colors.blueGrey),
          const Spacer(),
          const Text('AI 搜索',
              style: TextStyle(
                  fontSize: 22,
                  color: Color(0xFF7C4DFF),
                  fontWeight: FontWeight.bold)),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.headset_mic, color: Colors.blueGrey),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.pinkAccent),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSearchTabs() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16, bottom: 4),
            child: Text('常見搜尋項目',
                style: TextStyle(
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  logic.searchTabs.length,
                  (i) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFB2C6D6),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 0),
                            minimumSize: const Size(0, 28),
                          ),
                          onPressed: () {},
                          child: Text(logic.searchTabs[i],
                              style: const TextStyle(fontSize: 14)),
                        ),
                      )),
            ),
          ),
          const SizedBox(height: 4),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
                  List.generate(logic.searchTags.expand((e) => e).length, (i) {
                final tag = logic.searchTags.expand((e) => e).toList()[i];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFC857),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(tag,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14)),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatList() {
    return Expanded(
      child: Obx(() => ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            itemCount: logic.messages.length,
            itemBuilder: (context, i) {
              final msg = logic.messages[i];
              if (msg['type'] == 'text') {
                final isAi = msg['from'] == 'ai';
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment:
                      isAi ? MainAxisAlignment.start : MainAxisAlignment.end,
                  children: [
                    if (isAi) ...[
                      CircleAvatar(
                          radius: 22,
                          backgroundImage: AssetImage(msg['avatar'])),
                      const SizedBox(width: 8),
                    ],
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: isAi ? const Color(0xFFD6ECFF) : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Text(msg['text'],
                            style: const TextStyle(fontSize: 15)),
                      ),
                    ),
                    if (!isAi) ...[
                      const SizedBox(width: 8),
                      CircleAvatar(
                          radius: 22,
                          backgroundImage: AssetImage(msg['avatar'])),
                    ],
                  ],
                );
              } else if (msg['type'] == 'rich') {
                // AI 推荐商品种类
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                        radius: 22, backgroundImage: AssetImage(msg['avatar'])),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD6ECFF),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(msg['title'] ?? '',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                                const SizedBox(width: 8),
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(msg['action'] ?? '',
                                      style: const TextStyle(
                                          color: Colors.purple,
                                          fontSize: 15,
                                          decoration:
                                              TextDecoration.underline)),
                                ),
                              ],
                            ),
                            if (msg['desc'] != null) ...[
                              const SizedBox(height: 4),
                              Text(msg['desc'],
                                  style: const TextStyle(fontSize: 15)),
                            ],
                            if (msg['tags'] != null) ...[
                              const SizedBox(height: 8),
                              Wrap(
                                spacing: 8,
                                runSpacing: 4,
                                children: List.generate(
                                    (msg['tags'] as List).length,
                                    (i) => GestureDetector(
                                          onTap: () {},
                                          child: Text(
                                            msg['tags'][i],
                                            style: const TextStyle(
                                                color: Colors.purple,
                                                fontSize: 15,
                                                decoration:
                                                    TextDecoration.underline),
                                          ),
                                        )),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              } else if (msg['type'] == 'wait') {
                // 用户等待回复
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(Icons.more_horiz,
                          color: Colors.grey, size: 28),
                    ),
                    const SizedBox(width: 8),
                    const CircleAvatar(
                        radius: 22,
                        backgroundImage:
                            AssetImage('assets/img/about_me_icon.png')),
                  ],
                );
              }
              return const SizedBox();
            },
          )),
    );
  }

  Widget _buildBottomActions() {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            logic.bottomActions.length,
            (i) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7C4DFF),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
                onPressed: () {},
                child: Text(logic.bottomActions[i],
                    style: const TextStyle(fontSize: 13)),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputBar() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFB2C6FF), Color(0xFF7C4DFF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: logic.inputController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        isCollapsed: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                        hintText: '請輸入…',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  IconButton(
                    icon:
                        const Icon(Icons.add_circle, color: Color(0xFF7C4DFF)),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Transform.rotate(
            angle: -0.4,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(32),
                onTap: () {},
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFF2D55),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.send, color: Colors.white, size: 26),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
