import 'package:flutter/material.dart';
import 'package:tiny_weight/app/config/color.dart';
import 'package:tiny_weight/app/config/font.dart';
import 'package:tiny_weight/app/widgets/divider.dart';

class SingleSelectRow extends StatefulWidget {
  final String title;
  final List<String> radioTitles;

  final int? defaultValue;
  final ValueChanged<int?>? onChanged;

  const SingleSelectRow({
    Key? key,
    required this.title,
    required this.radioTitles,
    this.defaultValue,
    this.onChanged,
  }) : super(key: key);

  @override
  _SingleSelectRowState createState() => _SingleSelectRowState();
}

class _SingleSelectRowState extends State<SingleSelectRow> {
  int? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 120,
                child: Text(
                  widget.title,
                  style: KFont.titleStyle.copyWith(fontSize: 14),
                ),
              ),
              // const SizedBox(width: 20),
              Expanded(
                child: Wrap(
                    spacing: 4.0,
                    runSpacing: 0.0,
                    alignment: WrapAlignment.start,
                    children: [
                      ...widget.radioTitles.asMap().entries.map((entry) {
                        int index = entry.key + 1;
                        String title = entry.value;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedValue = index;
                            });
                            if (widget.onChanged != null) {
                              widget.onChanged!(index);
                            }
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Radio<int>(
                                  value: index,
                                  activeColor: KColor.appbarColor,
                                  groupValue: _selectedValue,
                                  onChanged: (int? value) {
                                    setState(() {
                                      _selectedValue = value;
                                    });
                                    if (widget.onChanged != null) {
                                      widget.onChanged!(value);
                                    }
                                  }),
                              Text(title),
                            ],
                          ),
                        );
                      }).toList()
                    ]),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          CzDivider(),
        ],
      ),
    );
  }
}
