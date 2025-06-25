import 'package:flutter/material.dart';

class DismissKeyboard extends StatelessWidget {
  final Widget? child;
  final Function? onKeyboardDismissed;
  const DismissKeyboard({Key? key, this.child, this.onKeyboardDismissed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: child,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        onKeyboardDismissed?.call();
      },
    );
  }
}
