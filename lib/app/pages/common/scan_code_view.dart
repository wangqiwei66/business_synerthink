// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:tiny_weight/app/config/color.dart';
import 'package:tiny_weight/app/config/font.dart';
import 'package:tiny_weight/app/config/path.dart';
import 'package:tiny_weight/app/pages/common/scan_code_logic.dart';
import 'package:tiny_weight/app/widgets/base_app_bar.dart';
import 'package:tiny_weight/app/widgets/home_scaffold.dart';
import 'package:tiny_weight/app/widgets/scalable.dart';
import 'package:tiny_weight/app/widgets/toast.dart';

class ScanCodePage extends StatefulWidget {
  const ScanCodePage({Key? key}) : super(key: key);

  @override
  State<ScanCodePage> createState() => _ScanCodePageState();
}

class _ScanCodePageState extends State<ScanCodePage> {
  final ScanCodeLogic _logic = Get.put(ScanCodeLogic());
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  static const String validPrefix =
      'https://testins.hrkjsa.com/lpg-info-portal';
  //https://testins.hrkjsa.com/lpg-info-portal/?qrcode=0962501000000
  bool _hasShownError = false;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScanCodeLogic>(builder: (model) {
      return WillPopScope(
          onWillPop: () async {
            // Handle back button press
            Get.back(result: _logic.code);
            return false; // Prevent default back behavior
          },
          child: HomeScaffold(
            child: Column(children: [
              Column(children: [
                SizedBox(
                  height: 48,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      ScalableWell(
                        onTap: () {
                          Get.back(result: _logic.code);
                        },
                        child: const Icon(Icons.close,
                            size: 25, color: KColor.textLowBlackColor),
                      ),
                      const Expanded(
                          child: Text(
                        '扫一扫',
                        textAlign: TextAlign.center,
                        style: KFont.appTitleStyle,
                      )),
                      const SizedBox(
                        width: 40,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
              ]),
              Expanded(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    _buildQrView(context),
                    Positioned(
                      bottom: 130,
                      child: ScalableWell(
                          onTap: () async {
                            await controller?.toggleFlash();
                            setState(() {});
                          },
                          child: FutureBuilder(
                            future: controller?.getFlashStatus(),
                            builder: (context, snapshot) {
                              return snapshot.data == true
                                  ? const Icon(
                                      Icons.flash_off_sharp,
                                      color: Colors.white,
                                      size: 50,
                                    )
                                  : const Icon(
                                      Icons.flash_on_sharp,
                                      color: Colors.white,
                                      size: 50,
                                    );
                            },
                          )),
                    ),
                  ],
                ),
              ),
            ]),
          ));
    });
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    // var scanArea = (MediaQuery.of(context).size.width < 400 ||
    //         MediaQuery.of(context).size.height < 400)
    //     ? 150.0
    //     : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: KColor.appbarColor,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: 300,
          cutOutBottomOffset: 30),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  String? codeText;
  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      if (codeText != null || _hasShownError) return;
      final uri = Uri.parse(scanData.code!);

      // 检查 URL 是否以 validPrefix 开头
      if (!uri.toString().startsWith(validPrefix)) {
        _hasShownError = true;
        showConfirmDialog(
          title: '扫描结果',
          content: '此二维码不支持',
          onlyRightButton: true,
          onRightButtonTap: () {
            codeText = null;
            _hasShownError = false;
            this.controller!.resumeCamera();
          },
        );
        return;
      }

      // 检查是否包含 qrcode 参数
      if (!uri.queryParameters.containsKey('qrcode')) {
        _hasShownError = true;
        showConfirmDialog(
          title: '扫描结果',
          content: '二维码格式不正确',
          onlyRightButton: true,
          onRightButtonTap: () {
            codeText = null;
            _hasShownError = false;
            this.controller!.resumeCamera();
          },
        );
        return;
      }

      codeText = uri.queryParameters['qrcode'];
      _logic.code = codeText ?? '';
      this.controller!.pauseCamera();
      Get.back(result: _logic.code);
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    dismissToast();
    super.dispose();
  }
}
