// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiny_weight/app/config/color.dart';
import 'package:tiny_weight/app/config/font.dart';

class PikerUtils {
  showStringPiker(
      {int defultIndex = 0, List valList = const [], Function(int)? backVal}) {
    showCupertinoModalPopup(
        context: Get.context!,
        builder: (BuildContext context) {
          var controllr = FixedExtentScrollController(initialItem: defultIndex);
          return Container(
            height: 250,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Container(
                  height: 50,
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          '取消'.tr,
                          style: KFont.listStyle.copyWith(
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          if (backVal != null) {
                            backVal(controllr.selectedItem);
                          }
                          Get.back();
                        },
                        child: Text(
                          '确认'.tr,
                          style: KFont.listStyle.copyWith(
                            color: KColor.appbarColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                    child: SizedBox(
                      height: 200,
                      child: CupertinoPicker(
                        scrollController: controllr,
                        itemExtent: 45,
                        backgroundColor: Colors.white,
                        selectionOverlay: Container(
                          decoration: BoxDecoration(
                            color: KColor.appbarColor.withOpacity(0.1),
                            // border: const Border(
                            //   top: BorderSide(
                            //       color: KColor.appbarColor, width: 1),
                            //   bottom: BorderSide(
                            //       color: KColor.appbarColor, width: 1),
                            // ),
                          ),
                        ),
                        onSelectedItemChanged: (value) {
                          print("value = $value");
                        },
                        children: valList.map((data) {
                          return Center(
                            child: Text(
                              data,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }).then((value) {
      // if (value != selectedValue && value != null) {
      //     setState(() {
      //       selectedValue = value;
      //     });
      // }
    });
  }
}
