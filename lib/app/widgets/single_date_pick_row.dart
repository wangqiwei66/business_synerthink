import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:tiny_weight/app/config/color.dart';
import 'package:tiny_weight/app/config/font.dart';
import 'package:tiny_weight/app/widgets/divider.dart';

class SingleDatePickRow extends StatefulWidget {
  final String title;
  final DateTime? initialDate;
  final ValueChanged<DateTime>? onDateSelected;
  final bool required;
  final String value;
  final DateTimePickerMode dateType;
  const SingleDatePickRow({
    Key? key,
    required this.title,
    this.initialDate,
    this.onDateSelected,
    this.required = false,
    this.value = '',
    this.dateType = DateTimePickerMode.datetime,
  }) : super(key: key);

  @override
  _SingleDatePickRowState createState() => _SingleDatePickRowState();
}

class _SingleDatePickRowState extends State<SingleDatePickRow> {
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    if (widget.value.isNotEmpty) {
      _selectedDate = DateTime.parse(widget.value);
    } else {
      _selectedDate = widget.initialDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Row(
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
              Expanded(
                child: GestureDetector(
                  onTap: _pickDate,
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
                          child: Container(
                            height: 40,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: const Color(0x33ffffff),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: _selectedDate != null
                                ? Text(
                                    DateFormat('yyyy-MM-dd HH:mm:ss')
                                        .format(_selectedDate!),
                                    style: const TextStyle(fontSize: 14.0),
                                  )
                                : const Text(
                                    "请选择时间",
                                    style: TextStyle(
                                        color: KColor.textGrayColor,
                                        fontSize: 14),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              )
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

  Future<void> _pickDate() async {
    DatePicker.showDatePicker(
      context,
      pickerMode: widget.dateType,
      dateFormat: widget.dateType == DateTimePickerMode.date
          ? 'yyyy-MM-dd'
          : 'yyyy-MM-dd HH:mm:ss',
      initialDateTime: _selectedDate ?? DateTime.now(),
      locale: DateTimePickerLocale.zh_cn,
      pickerTheme: const DateTimePickerTheme(
        cancelTextStyle: TextStyle(color: KColor.appbarColor),
        confirmTextStyle: TextStyle(color: KColor.appbarColor),
      ),
      onConfirm: (date, nil) {
        setState(() {
          _selectedDate = date;
          if (widget.onDateSelected != null) {
            widget.onDateSelected!(_selectedDate!);
          }
        });
      },
    );
  }
}
