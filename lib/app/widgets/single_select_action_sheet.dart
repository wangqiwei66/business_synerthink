import 'package:flutter/material.dart';
import 'package:tiny_weight/app/config/color.dart';
import 'package:tiny_weight/app/config/path.dart';
import 'package:tiny_weight/app/widgets/divider.dart';

/// 通用单选ActionSheet组件
class SingleSelectActionSheet extends StatefulWidget {
  final String title;
  final String subtitle;
  final List<String> options;
  final int? initialSelected;
  final ValueChanged<int> onConfirm;

  const SingleSelectActionSheet({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.options,
    this.initialSelected,
    required this.onConfirm,
  }) : super(key: key);

  @override
  State<SingleSelectActionSheet> createState() =>
      _SingleSelectActionSheetState();
}

class _SingleSelectActionSheetState extends State<SingleSelectActionSheet> {
  int? _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 16, bottom: 16), // 调整内边距
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('${base_img_path}sheet_top_bg.png'), // 背景图
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Center(
              child: Text(
                widget.title,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3E3E3E)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.subtitle,
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
                const SizedBox(
                  height: 12,
                ),
                CzDivider(),
                ...List.generate(widget.options.length, (index) {
                  return ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text(widget.options[index],
                        style: const TextStyle(fontSize: 14)),
                    trailing: _selectedIndex == index
                        ? const Icon(Icons.check_circle,
                            color: KColor.appbarColor)
                        : const Icon(Icons.radio_button_unchecked,
                            color: Colors.grey),
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  );
                }),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFCDFFA7),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: _selectedIndex != null
                        ? () {
                            Navigator.of(context).pop();
                            widget.onConfirm(_selectedIndex!);
                          }
                        : null,
                    child: const Text('确定',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
