import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:tiny_weight/app/widgets/base_app_bar.dart';
import 'package:tiny_weight/app/widgets/home_scaffold.dart';
import 'package:tiny_weight/app/widgets/button.dart';
import 'package:tiny_weight/app/widgets/toast.dart';
import 'package:signature/signature.dart';

class SignaturePage extends StatefulWidget {
  const SignaturePage({super.key});

  @override
  _SignaturePageState createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {
  // 创建一个 SignatureController
  final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  @override
  void dispose() {
    _signatureController.dispose();
    super.dispose();
  }

  Future<void> _saveSignature() async {
    // 获取签名图像的二进制数据
    if (_signatureController.isNotEmpty) {
      final Uint8List? data = await _signatureController.toPngBytes();
      if (data != null) {
        // 返回签名数据
        Navigator.pop(context, data);
      }
    } else {
      showConfirmDialog(title: '请先签名', content: '签名内容不能为空');
    }
  }

  void _clearSignature() {
    _signatureController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
        child: Column(children: [
      const BaseAppBar(title: '用户签名'),
      Expanded(
        child: Column(
          children: [
            Expanded(
              child: Signature(
                controller: _signatureController,
                backgroundColor: Colors.white,
              ),
            ),
            CzButton(
              width: MediaQuery.of(context).size.width - 40,
              text: '保存签名',
              ontap: () => _saveSignature(),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      )
    ]));
  }
}
