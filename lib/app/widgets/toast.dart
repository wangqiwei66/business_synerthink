import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:tiny_weight/app/common/widget_extention.dart';
import 'package:tiny_weight/app/config/color.dart';
import 'package:tiny_weight/app/config/font.dart';
import 'package:tiny_weight/app/config/path.dart';
import 'package:tiny_weight/app/widgets/bottom_height.dart';
import 'package:tiny_weight/app/widgets/button.dart';
import 'package:tiny_weight/app/widgets/divider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tiny_weight/app/widgets/scalable.dart';

///切換語言
// showChangeLocale() {
//   showDialog(
//       barrierDismissible: true, //是否點選空白區域關閉對話方塊,預設為true，可以關閉
//       context: Get.context!,
//       builder: (BuildContext context) {
//         var list = [
//           {'name': '繁體中文'},
//           //{'name': '簡體中文'},
//           {'name': 'English'},
//         ];

//         return MisBottomSheet(
//           list: list,
//           onItemClickListener: (index) async {
//             if (index == 0) {
//               KLocale().changeLocale(key: LocaleKey.hk);
//             } else if (index == 1) {
//               //  KLocale().changeLocale(key: LocaleKey.cn);
//               //} else if (index == 2) {
//               KLocale().changeLocale(key: LocaleKey.us);
//             }

//             SpUtil().setJSON('kSelectLocale', index);
//           },
//         );
//       });
// }

showAlert(
  BuildContext context,
  String title,
  String content,
  String txt1,
  Function onPre1, {
  String txt2 = "",
  Function? onPre2,
}) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Material(
            child: Container(
              color: Colors.red,
              height: 200,
              width: 100,
              child: const Text('sdasdasda'),
            ),
          ));
}

Future<List<int>?> showJubao() {
  List<String> datas = [
    '色情內容'.tr,
    '暴力或令人反感的內容'.tr,
    '仇恨或辱罵內容'.tr,
    '有害或危險行為'.tr,
    '虐待兒童'.tr,
    '侵犯著作權'.tr,
    '宣揚恐怖主義'.tr,
    '誤導資訊'.tr,
  ];
  Set<int> selected = <int>{};

  return showModalBottomSheet<List<int>>(
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    context: Get.context!,
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (context1, setState) {
        return Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          height: MediaQuery.of(context).size.height / 2.0,
          child: Column(children: [
            _getModalSheetHeaderWithConfirm(
              '舉報'.tr,
              onCancel: () {
                Navigator.of(context).pop();
              },
              onConfirm: () {
                Navigator.of(context).pop(selected.toList());
              },
            ),
            const Divider(height: 1.0),
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    trailing: Icon(
                      selected.contains(index)
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text(datas[index]),
                    onTap: () {
                      setState(() {
                        if (selected.contains(index)) {
                          selected.remove(index);
                        } else {
                          selected.add(index);
                        }
                      });
                    },
                  );
                },
                itemCount: datas.length,
              ),
            ),
          ]),
        );
      });
    },
  );
}

Widget _getModalSheetHeaderWithConfirm(String title,
    {Function? onCancel, Function? onConfirm}) {
  return SizedBox(
    height: 50,
    child: Row(
      children: [
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            onCancel!();
          },
        ),
        Expanded(
          child: Center(
            child: Text(
              title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
          ),
        ),
        IconButton(
            icon: Icon(
              Icons.check,
              color: Theme.of(Get.context!).primaryColor,
            ),
            onPressed: () {
              onConfirm!();
            }),
      ],
    ),
  );
}

void showCodeDialog({
  title,
  codeText,
  showText,
  showTextColor,
  bool showCodeText = true,
}) {
  showDialog(
    context: Get.context!,
    builder: (BuildContext context) {
      return Container(
        alignment: Alignment.center,
        child: Container(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title != null)
                  Text(
                    title ?? '',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                const SizedBox(
                  height: 10,
                ),
                QrImageView(
                  // backgroundColor: Colors.white,
                  // foregroundColor: Colours.app_main,
                  data: '$codeText',
                  size: 300.0,
                ),
                if (showCodeText) Text(codeText ?? ''),
                const SizedBox(
                  height: 10,
                ),
                if (showText != null) ...[
                  Text(
                    showText ?? '',
                    style: TextStyle(color: showTextColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ]
              ],
            )),
      );
    },
  );
}

Future<void> showConfirmDialog({
  required String title,
  required String content,
  String iconPath = '${base_img_path}icon_tip_log.png',
  String leftButtonText = '取消',
  String rightButtonText = '确认',
  VoidCallback? onLeftButtonTap,
  VoidCallback? onRightButtonTap,
  bool barrierDismissible = true,
  bool onlyRightButton = false,
  TextAlign contentAlign = TextAlign.center,
  double? dialogWidth,
}) {
  return showDialog(
    barrierDismissible: barrierDismissible,
    context: Get.context!,
    builder: (context) {
      dialogWidth = dialogWidth ?? MediaQuery.of(context).size.width * 0.85;
      return Dialog(
        insetAnimationDuration: const Duration(milliseconds: 300),
        insetAnimationCurve: Curves.easeOutBack,
        child: Container(
          width: dialogWidth,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 24),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: KColor.appbarColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.notifications_outlined,
                  color: KColor.appbarColor,
                  size: 28,
                ),
              )
                  .animate(
                    onPlay: (controller) => controller.repeat(reverse: true),
                  )
                  .shake(
                    delay: 500.ms,
                    duration: 500.ms,
                    hz: 4,
                    rotation: 0.3,
                    curve: Curves.easeInOut,
                  ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  content,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    height: 1.5,
                  ),
                  textAlign: contentAlign,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Color(0xFFEEEEEE),
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: onlyRightButton
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.spaceEvenly,
                  children: [
                    if (!onlyRightButton)
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            if (onLeftButtonTap != null) {
                              onLeftButtonTap();
                            }
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            height: 56,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: Color(0xFFEEEEEE),
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Text(
                              leftButtonText,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          if (onRightButtonTap != null) {
                            onRightButtonTap();
                          }
                        },
                        child: Container(
                          height: 56,
                          alignment: Alignment.center,
                          child: Text(
                            rightButtonText,
                            style: const TextStyle(
                              fontSize: 16,
                              color: KColor.appbarColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ).animate().scale(
              duration: 300.ms,
              curve: Curves.easeOutBack,
              begin: const Offset(0.6, 0.6),
              end: const Offset(1.0, 1.0),
            ),
      );
    },
  );
}

Future showConfirmDialogOld(
  BuildContext context,
  String content,
  Function confirmCallback, {
  bool outTouchCancellable = true,
  String? okText,
  String? cancelText,
  Function? cancelCallback,
  bool onlyOk = false,
}) async {
  await showDialog(
      barrierDismissible: outTouchCancellable,
      context: context,
      builder: (context) {
        return Container(
          alignment: Alignment.center,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 70,
                    left: 20,
                    right: 20,
                    bottom: 100,
                  ),
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 30,
                    right: 30,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        content,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: KColor.textblackColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      CzDivider(
                        height: 1,
                        width: double.infinity,
                        dividerColor: KColor.appbarColor,
                      ),
                      ScalableWell(
                          onTap: () {
                            Navigator.of(context).pop();
                            confirmCallback.call();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            child: Text(
                              okText ?? '确定'.tr,
                              style: const TextStyle(
                                  color: KColor.textblackColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      onlyOk
                          ? const SizedBox()
                          : CzDivider(
                              height: 1,
                              width: double.infinity,
                              dividerColor: KColor.appbarColor,
                            ),
                      onlyOk
                          ? const SizedBox()
                          : ScalableWell(
                              onTap: () {
                                Navigator.of(context).pop();
                                cancelCallback?.call();
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  child: Text(
                                    cancelText ?? '取消'.tr,
                                    style: const TextStyle(
                                        color: KColor.textblackColor,
                                        fontWeight: FontWeight.bold),
                                  )),
                            )
                    ],
                  ),
                ),
                Positioned(
                    child: Image.asset(
                  '${base_img_path}icon_tip_log.png',
                  height: 140,
                  width: 140,
                )),
              ],
            ),
          ]),
        );
      });
}

void showThreeConfirmDialog(
  BuildContext context,
  String content, {
  bool outTouchCancellable = true,
  String? oneText,
  String? twoText,
  String? threeText,
  Function? oneTap,
  Function? twoTap,
  Function? threeTap,
  bool onlyOk = false,
}) {
  showDialog(
      barrierDismissible: outTouchCancellable,
      context: context,
      builder: (context) {
        return Container(
          alignment: Alignment.center,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 70,
                    left: 20,
                    right: 20,
                    bottom: 100,
                  ),
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 30,
                    right: 30,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        content,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: KColor.textblackColor,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      if (oneTap != null)
                        CzDivider(
                          height: 1,
                          width: double.infinity,
                          dividerColor: KColor.appbarColor,
                        ),
                      if (oneTap != null)
                        ScalableWell(
                            onTap: () {
                              Navigator.of(context).pop();
                              oneTap.call();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              child: Text(
                                oneText ?? '確定'.tr,
                                style: const TextStyle(
                                  color: KColor.textblackColor,
                                ),
                              ),
                            )),
                      CzDivider(
                        height: 1,
                        width: double.infinity,
                        dividerColor: KColor.appbarColor,
                      ),
                      if (twoTap != null)
                        ScalableWell(
                          onTap: () {
                            Navigator.of(context).pop();
                            twoTap.call();
                          },
                          child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              child: Text(
                                twoText ?? '取消'.tr,
                                style: const TextStyle(
                                  color: KColor.textblackColor,
                                ),
                              )),
                        ),
                      if (twoTap != null)
                        CzDivider(
                          height: 1,
                          width: double.infinity,
                          dividerColor: KColor.appbarColor,
                        ),
                      if (threeTap != null)
                        ScalableWell(
                          onTap: () {
                            Navigator.of(context).pop();
                            threeTap.call();
                          },
                          child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              child: Text(
                                threeText ?? '取消'.tr,
                                style: const TextStyle(
                                  color: KColor.textblackColor,
                                ),
                              )),
                        )
                    ],
                  ),
                ),
                Positioned(
                  child: Image.asset(
                    '${base_img_path}icon_tip_log.png',
                    height: 140,
                    width: 140,
                  )
                      .animate(
                        onPlay: (controller) =>
                            controller.repeat(reverse: true),
                      )
                      .shake(
                        duration: 500.ms,
                        hz: 4,
                        rotation: 0.05,
                        curve: Curves.easeInOut,
                      ),
                ),
              ],
            ),
          ]),
        );
      });
}

///展示底部彈窗
Future<bool> showBottomDialog(
  BuildContext context,
  Widget child, {
  bool isScrollControlled = true,
  Color color = Colors.white,
  bool removeBottom = true,
  bool isDismissible = true,
  bool enableDrag = true,
}) {
  return showModalBottomSheet(
    context: context,
    isDismissible: isDismissible,
    isScrollControlled: isScrollControlled,
    backgroundColor: color,
    enableDrag: enableDrag,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
    ),
    builder: (BuildContext context) {
      if (removeBottom) {
        return context.removeBottomPadding(child);
      }
      return child;
    },
  ).then((value) => value ?? false);
}

Future showPermissionAlert(
  BuildContext context,
  String content,
  Function confirmCallback, {
  String? okText,
}) async {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () async => false, //重點此舉
            child: Container(
              alignment: Alignment.center,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 70,
                        left: 20,
                        right: 20,
                        bottom: 100,
                      ),
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 30,
                        right: 30,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Text(
                            content,
                            style: const TextStyle(
                              color: KColor.textblackColor,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          CzDivider(
                            height: 1,
                            width: double.infinity,
                            dividerColor: KColor.appbarColor,
                          ),
                          ScalableWell(
                              onTap: () {
                                // Navigator.of(context).pop();
                                confirmCallback.call();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                child: Text(
                                  okText ?? '確定'.tr,
                                  style: const TextStyle(
                                    color: KColor.textblackColor,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    Positioned(
                      child: Image.asset(
                        '${base_img_path}icon_tip_log.png',
                        height: 140,
                        width: 140,
                      )
                          .animate(
                            onPlay: (controller) =>
                                controller.repeat(reverse: true),
                          )
                          .shake(
                            duration: 500.ms,
                            hz: 4,
                            rotation: 0.05,
                            curve: Curves.easeInOut,
                          ),
                    ),
                  ],
                ),
              ]),
            ));
      });
}

///顯示訊息
void showToast(String text) {
  EasyLoading.showInfo(text);
}

void showLoading({
  String? text,
  bool? dismissOnTap = true,
}) {
  EasyLoading.show(
    status: text,
  );
}

void hideLoading() {
  EasyLoading.dismiss();
}

void dismissToast() {
  EasyLoading.dismiss();
}
