//
// 檔名稱：SBottmSheetDialog.dart
//

// ignore_for_file: prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables, prefer_function_declarations_over_variables, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiny_weight/app/config/color.dart';
// import 'package:mis_mobile/common/components/divider.dart';
// import 'package:mis_mobile/common/constants/app_colors.dart';

/// 底部彈出框
class MisBottomSheet extends StatefulWidget {
  MisBottomSheet({Key? key, required this.list, this.onItemClickListener})
      : assert(list != null),
        super(key: key);
  final list;
  final OnItemClickListener? onItemClickListener;
  @override
  _MisBottomSheetState createState() => _MisBottomSheetState();
}

typedef OnItemClickListener = void Function(int index);

class _MisBottomSheetState extends State<MisBottomSheet> {
  OnItemClickListener? onItemClickListener;
  var itemCount;
  double itemHeight = 44;
  var borderColor = Colors.white;
  double circular = 25;
  @override
  void initState() {
    super.initState();
    onItemClickListener = widget.onItemClickListener;
  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    Size screenSize = MediaQuery.of(context).size;

    var deviceWidth = orientation == Orientation.portrait
        ? screenSize.width
        : screenSize.height;
    // print('devide width');
    // print(deviceWidth);

    /// *2-1是為了加分割線，最後還有一個cancel，所以加1
    itemCount = (widget.list.length * 2 - 1) + 1;
    var height = ((widget.list.length + 1) * 48).toDouble();
    var cancelContainer = GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
          height: itemHeight,
          margin: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            color: Colors.white, // 底色
            borderRadius: BorderRadius.circular(circular),
          ),
          child: Center(
            child: Text(
              "取消".tr,
              style: const TextStyle(
                  fontFamily: 'Robot',
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                  color: Color(0xff333333),
                  fontSize: 15),
            ),
          )),
    );

    var listview = ListView.builder(
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          if (index == itemCount - 1) {
            return Container(
              margin: const EdgeInsets.only(top: 10),
              child: cancelContainer,
            );
          }
          return getItemContainer(context, index);
        });

    var totalContainer = Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: height,
      width: deviceWidth * 0.98,
      child: listview,
    );

    var stack = Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          bottom: 0,
          child: totalContainer,
        ),
      ],
    );
    return stack;
  }

  Widget getItemContainer(BuildContext context, int index) {
    if (widget.list == null) {
      return Container();
    }
    if (index.isOdd) {
      return Container(
        // color: Colors.red,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: const Divider(
          height: 0.5,
          color: KColor.lineColor,
        ),
      );
    }

    var borderRadius;
    var margin;
    var isFirst = false;
    var isLast = false;

    /// 只有一個元素
    if (widget.list.length == 1) {
      borderRadius = BorderRadius.circular(circular);
      margin = const EdgeInsets.only(left: 10, right: 10);
    } else if (widget.list.length > 1) {
      /// 第一個元素
      if (index == 0) {
        isFirst = true;
        borderRadius = BorderRadius.only(
            topLeft: Radius.circular(circular),
            topRight: Radius.circular(circular));
        margin = const EdgeInsets.only(
          left: 10,
          right: 10,
        );
      } else if (index == itemCount - 2) {
        isLast = true;

        /// 最後一個元素
        borderRadius = BorderRadius.only(
            bottomLeft: Radius.circular(circular),
            bottomRight: Radius.circular(circular));
        margin = const EdgeInsets.only(left: 10, right: 10);
      } else {
        /// 其他位置元素
        margin = const EdgeInsets.only(left: 10, right: 10);
      }
    }
    var isFirstOrLast = isFirst || isLast;
    int listIndex = index ~/ 2;
    var text = widget.list[listIndex]['name'];
    var contentText = Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.normal,
          decoration: TextDecoration.none,
          color: widget.list[listIndex]['color'],
          fontSize: 15),
    );

    var center;
    if (!isFirstOrLast) {
      center = Center(
        child: contentText,
      );
    }
    var itemContainer = Container(
        height: itemHeight,
        margin: margin,
        decoration: BoxDecoration(
          color: Colors.white, // 底色
          borderRadius: borderRadius,
          // border: border,
        ),
        child: center);
    var onTap2 = () {
      if (onItemClickListener != null) {
        Navigator.pop(context);
        onItemClickListener!(listIndex);
      }
    };
    var stack = Stack(
      alignment: Alignment.center,
      children: <Widget>[itemContainer, contentText],
    );
    var getsture = GestureDetector(
      onTap: onTap2,
      child: isFirstOrLast ? stack : itemContainer,
    );
    return getsture;
  }
}
