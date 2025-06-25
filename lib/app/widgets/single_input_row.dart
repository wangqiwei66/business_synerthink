import 'package:flutter/material.dart';
import 'package:tiny_weight/app/config/color.dart';
import 'package:tiny_weight/app/config/font.dart';
import 'package:tiny_weight/app/widgets/divider.dart';
import 'package:tiny_weight/app/widgets/textfeild.dart';

class SingleInputRow extends StatefulWidget {
  final String title;
  final String tips;
  final TextInputType? keyboardType;
  final ValueChanged<String>? valChanged;
  final ValueChanged<String>? onSubmited;
  final bool required;
  final String value;

  const SingleInputRow({
    Key? key,
    required this.title,
    required this.tips,
    this.keyboardType = TextInputType.phone,
    this.valChanged,
    this.onSubmited,
    this.required = false,
    this.value = '',
  }) : super(key: key);

  @override
  _SingleInputRowState createState() => _SingleInputRowState();
}

class _SingleInputRowState extends State<SingleInputRow> {
  @override
  void initState() {
    super.initState();
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.required)
                      const Text(
                        '*',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                        ),
                      ),
                    Text(
                      widget.title,
                      style: KFont.titleStyle.copyWith(fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: Color(0xfff5f5f5),
                    // color: Colors.red,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: SizedBox(
                        height: 40,
                        child: CzTextField(
                          keyboardType: widget.keyboardType,
                          hitStyle: const TextStyle(
                              color: KColor.textGrayColor, fontSize: 14),
                          value: widget.value,
                          hintText: widget.tips,
                          valChanged: widget.valChanged,
                          onSubmitted: widget.onSubmited,
                        ),
                      )),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
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
