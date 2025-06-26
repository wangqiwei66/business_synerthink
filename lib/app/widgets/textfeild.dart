// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiny_weight/app/config/color.dart';
// import 'package:mis_mobile/common/components/inputFormatter.dart';
// import '../../../common/constants/specifications.dart';

class CzTextField extends StatelessWidget {
  final String? hintText;
  final TextInputType? keyboardType;
  final int maxLines;
  final int inputCount;
  final Function(String)? valChanged;
  final Function(String)? onSubmitted;

  final bool isPhone;
  final String? value;
  final bool obscureText;
  final Color? bgColor;
  final double? height;

  final TextStyle? hitStyle;
  final FocusNode? focusNode;
  final TextInputAction? action;

  final Widget? leftWidget;
  final TextAlign? textAlign;
  const CzTextField({
    this.hintText,
    this.valChanged,
    this.maxLines = 1,
    this.inputCount = 99,
    this.keyboardType,
    this.isPhone = false,
    this.obscureText = false,
    this.value,
    this.onSubmitted,
    this.bgColor,
    this.height,
    this.hitStyle,
    this.focusNode,
    this.action,
    this.leftWidget,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    final height = 30.0 * maxLines;
    final borderRadius =
        maxLines == 1 ? BorderRadius.circular(15) : BorderRadius.circular(15);
    return Container(
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bgColor ?? const Color(0x33ffffff),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          leftWidget ?? SizedBox(),
          Expanded(
            child: TextField(
              textAlign: textAlign ?? TextAlign.start,
              focusNode: focusNode,
              controller: TextEditingController.fromValue(TextEditingValue(
                text: value ?? '',
                selection: TextSelection.fromPosition(TextPosition(
                    affinity: TextAffinity.downstream,
                    offset: (value ?? '').length)),
              )),
              obscureText: obscureText,
              onChanged: valChanged,
              keyboardType: keyboardType,
              textInputAction: action,
              inputFormatters: [LengthLimitingTextInputFormatter(inputCount)],
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
              onSubmitted: onSubmitted,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: BorderSide(
                    color: KColor.appbarColor,
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: BorderSide(
                    color: Colors.black45,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: BorderSide(
                    color: KColor.appbarColor,
                    width: 1.5,
                  ),
                ),
                hintText: hintText,
                hintStyle: hitStyle ??
                    TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14,
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CzHitTextField extends StatelessWidget {
  final String? hintText;
  final String? value;

  ///設定hitText，預設無動畫
  final TextStyle? hintTextStyle;
  final TextInputType? keyboardType;
  final int maxLines;
  final int inputCount;
  final Function(String)? valChanged;
  final Function()? onTap;

  final Function()? onEditingComplete;
  final bool isDouble;
  final bool isPhone;
  final TextEditingController? controller;
  final bool obscureText;
  final bool isRequired;
  final bool showLine;
  final Widget? leftWidget;
  final EdgeInsets? padding;
  final TextAlign textAlign;
  final FocusNode? focusNode;
  final bool enabled;
  const CzHitTextField({
    this.hintText,
    this.valChanged,
    this.maxLines = 1,
    this.inputCount = 9999,
    this.keyboardType,
    this.isDouble = false,
    this.obscureText = false,
    this.controller,
    this.isRequired = false,
    this.showLine = true,
    this.leftWidget,
    this.hintTextStyle,
    this.value,
    this.padding,
    this.isPhone = false,
    this.textAlign = TextAlign.start,
    this.focusNode,
    this.onTap,
    this.enabled = true,
    this.onEditingComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 60,
      padding: padding,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0x33ffffff),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: TextField(
        enabled: enabled,
        onTap: onTap,
        onEditingComplete: onEditingComplete,
        focusNode: focusNode,
        controller: TextEditingController.fromValue(TextEditingValue(
          text: value ?? '', //判斷keyword是否為空
          selection: TextSelection.fromPosition(TextPosition(
              affinity: TextAffinity.downstream, offset: (value ?? '').length)),
          // 保持遊標在最後
        )),
        maxLines: maxLines,
        onChanged: valChanged,
        obscureText: obscureText,
        textAlign: textAlign,
        keyboardType: isDouble
            ? const TextInputType.numberWithOptions(decimal: true)
            : keyboardType,
        inputFormatters: [
          LengthLimitingTextInputFormatter(inputCount),
          if (isDouble) FilteringTextInputFormatter.allow(RegExp("[0-9.]")),
          if (isPhone) FilteringTextInputFormatter.allow(RegExp("[0-9]")),
        ],
        decoration: showLine
            ? InputDecoration(
                enabledBorder: showLine
                    ? const UnderlineInputBorder(
                        borderSide: BorderSide(color: KColor.lineColor))
                    : null,
                label: _hitText(),
                floatingLabelBehavior: hintTextStyle != null
                    ? FloatingLabelBehavior.always
                    : FloatingLabelBehavior.auto,
                floatingLabelStyle: hintTextStyle,
                prefixIcon: leftWidget,
              )
            : InputDecoration.collapsed(
                hintText: hintText,
              ),
      ),
    );
  }

  _hitText() {
    return Text.rich(
      TextSpan(
        text: hintText ?? '',
        style: hintTextStyle,
        children: isRequired
            ? [
                const TextSpan(text: '*', style: TextStyle(color: Colors.red)),
              ]
            : null,
      ),
    );
  }
}

class CzRemarkTextField extends StatelessWidget {
  final String? hintText;
  final String? value;
  final TextInputType? keyboardType;
  final int maxLines;
  final int inputCount;
  final Function(String)? valChanged;

  final bool isPhone;
  final TextEditingController? controller;
  final bool obscureText;
  final Color? textColor;
  final TextStyle? textStyle;
  final bool? enabled;
  const CzRemarkTextField({
    this.hintText,
    this.valChanged,
    this.maxLines = 1,
    this.inputCount = 999,
    this.keyboardType,
    this.isPhone = false,
    this.obscureText = false,
    this.controller,
    this.value = '',
    this.textColor,
    this.textStyle,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextField(
      enabled: enabled,
      controller: controller ??
          TextEditingController.fromValue(TextEditingValue(
            text: value ?? '', //判斷keyword是否為空
            selection: TextSelection.fromPosition(TextPosition(
                affinity: TextAffinity.downstream,
                offset: (value ?? '').length)),
            // 保持遊標在最後
          )),
      obscureText: obscureText,
      onChanged: valChanged,
      keyboardType: keyboardType,
      maxLines: maxLines,
      maxLength: inputCount,
      style: textStyle ??
          TextStyle(
            color: textColor ?? Colors.black,
            fontSize: 17,
          ),
      decoration: InputDecoration(
        // contentPadding: EdgeInsets.all(0),
        // contentPadding: EdgeInsets.only(top: 0, bottom: 6),
        contentPadding: const EdgeInsets.only(top: 0, bottom: 0),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        hintText: hintText,

        hintStyle: const TextStyle(color: KColor.lineColor),
      ),
    ));
  }
}

class CzBorderTextField extends StatelessWidget {
  final String? hintText;
  final String? value;

  ///設定hitText，預設無動畫
  final TextStyle? hintTextStyle;
  final TextInputType? keyboardType;
  final int maxLines;
  final int inputCount;
  final Function(String)? valChanged;

  final bool isPhone;
  final TextEditingController? controller;
  final bool obscureText;
  final bool isRequired;
  final bool showLine;
  final Widget? leftWidget;
  final Widget? rightWidget;
  final Color? bgColor;
  const CzBorderTextField({
    this.hintText,
    this.valChanged,
    this.maxLines = 1,
    this.inputCount = 9999,
    this.keyboardType,
    this.isPhone = false,
    this.obscureText = false,
    this.controller,
    this.isRequired = false,
    this.showLine = true,
    this.leftWidget,
    this.hintTextStyle,
    this.value,
    this.rightWidget,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController.fromValue(TextEditingValue(
        text: value ?? '', //判斷keyword是否為空
        // selection: TextSelection.fromPosition(TextPosition(
        //     affinity: TextAffinity.downstream, offset: (value ?? '').length)),
        // 保持遊標在最後
      )),
      inputFormatters: [
        LengthLimitingTextInputFormatter(inputCount),
        if (isPhone) FilteringTextInputFormatter.allow(RegExp("[0-9]")),
      ],
      autofocus: false,
      onChanged: valChanged,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        fillColor: bgColor, // 設定輸入框背景色為灰色
        filled: bgColor != null,
        suffixIcon: rightWidget,
        suffixIconColor: KColor.appbarColor,
        contentPadding:
            const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffB6B6B6), width: 0.5)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: KColor.appbarColor, width: 1.5)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintStyle: const TextStyle(fontSize: 13),
        hintText: hintText,
      ),
    );
  }
}

class CzIconTextField extends StatelessWidget {
  final String? hintText;
  final TextInputType? keyboardType;
  final int maxLines;
  final int inputCount;
  final Function(String)? valChanged;
  final Function(String)? onSubmitted;

  final bool isPhone;
  final String? value;
  final bool obscureText;
  final Color? bgColor;
  final double? height;

  final TextStyle? hitStyle;
  final FocusNode? focusNode;
  final TextInputAction? action;
  const CzIconTextField({
    this.hintText,
    this.valChanged,
    this.maxLines = 1,
    this.inputCount = 99,
    this.keyboardType,
    this.isPhone = false,
    this.obscureText = false,
    this.value,
    this.onSubmitted,
    this.bgColor,
    this.height,
    this.hitStyle,
    this.focusNode,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController c = TextEditingController.fromValue(TextEditingValue(
      text: value ?? '', //判斷keyword是否為空
      selection: TextSelection.fromPosition(TextPosition(
          affinity: TextAffinity.downstream, offset: (value ?? '').length)),

      // 保持遊標在最後
    ));
    return Container(
        height: height ?? 19,

        // margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
        // padding: EdgeInsets.only(, bottom: 0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor ?? const Color(0x33ffffff),
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                // cursorHeight: 44,
                focusNode: focusNode,
                controller: c,
                obscureText: obscureText,
                onChanged: valChanged,
                keyboardType: keyboardType,
                textInputAction: action,
                inputFormatters: [LengthLimitingTextInputFormatter(inputCount)],
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ),
                onSubmitted: onSubmitted,
                decoration: InputDecoration(
                  // suffixIcon: ScalableWell(
                  //   onTap: () {
                  //     c.clear();
                  //     valChanged!('');
                  //   },
                  //   child: const Icon(
                  //     Icons.cancel,
                  //     color: KColor.textGaryColor,
                  //   ),
                  // ),
                  contentPadding: const EdgeInsets.only(top: 0, bottom: 0),
                  // contentPadding: const EdgeInsets.only(top: 10, bottom: 20),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  hintText: hintText,
                  hintStyle:
                      hitStyle ?? const TextStyle(color: KColor.lineColor),
                ),
              ),
            )
          ],
        ));
  }
}

class CzTitleBorderTextField extends StatelessWidget {
  final String? hintText;
  final String? value;
  final String? title;
  final bool? isRequired;
  final int? maxLength;

  final Function(String)? valChanged;
  const CzTitleBorderTextField({
    this.hintText,
    this.valChanged,
    this.title,
    this.isRequired = false,
    this.value,
    this.maxLength = 300,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(title ?? ''),
            if (isRequired == true)
              const Text(
                '*',
                style: TextStyle(color: Colors.red),
              )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 200, minHeight: 200
              // maxWidth:
              ),
          child: TextField(
            maxLength: maxLength,
            minLines: 10,
            maxLines: 20,
            controller: TextEditingController(text: value),
            onChanged: valChanged,
            decoration: InputDecoration(
              // errorText: '內容最少輸入30字',
              contentPadding: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 10, right: 10),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffB6B6B6), width: 0.5)),
              focusedBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: KColor.appbarColor, width: 1.5)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintStyle: const TextStyle(fontSize: 13),
              hintText: hintText,
            ),
          ),
        ),
      ],
    );
  }
}

class CzIconBorderTextField extends StatelessWidget {
  final String? hintText;
  final String? value;
  final double? height;
  final double? width;
  final TextStyle? hintTextStyle;
  final TextInputType? keyboardType;
  final int maxLines;
  final int inputCount;
  final Function(String)? valChanged;
  final Function(String)? onSubmitted;
  final Function()? onTap;
  final bool isPhone;
  final TextEditingController? controller;
  final bool obscureText;
  final bool isRequired;
  final bool showLine;
  final Widget? leftWidget;
  final Widget? rightWidget;
  final Color? bgColor;
  final Color? hintColor;
  final BorderRadius? radius;
  final bool isEamilLowCode;
  final double borderWidth;
  final FocusNode? focusNode;
  final bool readOnly; // 新增的属性

  const CzIconBorderTextField({
    this.hintText,
    this.valChanged,
    this.onTap,
    this.height,
    this.width = double.infinity,
    this.onSubmitted,
    this.maxLines = 1,
    this.inputCount = 1000,
    this.keyboardType,
    this.isPhone = false,
    this.obscureText = false,
    this.controller,
    this.isRequired = false,
    this.showLine = true,
    this.leftWidget,
    this.hintTextStyle,
    this.value,
    this.rightWidget,
    this.bgColor,
    this.hintColor = const Color(0xffBEC5C9),
    this.radius,
    this.isEamilLowCode = false,
    this.borderWidth = 0,
    this.focusNode,
    this.readOnly = false, // 默认值为 false
  });

  @override
  Widget build(BuildContext context) {
    TextStyle hintStype = TextStyle(fontSize: 14, color: hintColor);
    TextEditingController c = TextEditingController.fromValue(TextEditingValue(
      text: value ?? '',
      selection: TextSelection.fromPosition(TextPosition(
          affinity: TextAffinity.downstream, offset: (value ?? '').length)),
    ));

    return SizedBox(
        width: width ?? 300,
        height: height ?? 40,
        child: TextField(
          focusNode: focusNode,
          onTap: onTap,
          controller: c,
          inputFormatters: [
            LengthLimitingTextInputFormatter(inputCount),
            if (isPhone) FilteringTextInputFormatter.allow(RegExp("[0-9]")),
            if (isEamilLowCode)
              FilteringTextInputFormatter.deny(RegExp(r'[\u4e00-\u9fa5]')),
          ],
          onChanged: valChanged,
          onSubmitted: (p0) {
            onSubmitted?.call(p0);
          },
          obscureText: obscureText,
          keyboardType: keyboardType,
          readOnly: readOnly, // 使用 readOnly 属性
          decoration: InputDecoration(
            fillColor: bgColor,
            filled: bgColor != null,
            suffixIcon: rightWidget,
            prefixIcon: leftWidget != null
                ? Container(
                    width: 50,
                    margin:
                        EdgeInsets.only(top: 5, bottom: 5, right: 10, left: 0),
                    decoration: BoxDecoration(
                        border: Border(
                      right: BorderSide(
                        color: KColor.hintfColor,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                    )),
                    child: leftWidget,
                  )
                : null,
            contentPadding:
                const EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderWidth == 0 ? Colors.white : Color(0xffB6B6B6),
                  width: borderWidth,
                ),
                borderRadius: radius ?? BorderRadius.circular(20)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: KColor.appbarColor,
                  width: 1,
                ),
                borderRadius: radius ?? BorderRadius.circular(20)),
            border: OutlineInputBorder(
                borderRadius: radius ?? BorderRadius.circular(20)),
            hintStyle: hintStype,
            hintText: hintText,
          ),
        ));
  }
}
