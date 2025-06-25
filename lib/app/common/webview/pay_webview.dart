import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiny_weight/app/common/shared_info.dart';
import 'package:tiny_weight/app/config/color.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PayWebView extends StatefulWidget {
  PayWebView({
    super.key,
    this.link,
    this.title = '',
  });

  final String? link;
  String? title;
  var result = '';
  @override
  _PayWebViewState createState() => _PayWebViewState();
}

class _PayWebViewState extends State<PayWebView> {
  late WebViewController _webViewController;
  bool? isFrist;
  @override
  void initState() {
    super.initState();
    isFrist = true;
    // Uri.decodeComponent(encodedUrl); // To decode url
    // if (Platform.isAndroid) {
    //   WebView.platform = SurfaceAndroidWebView();
    // }
    try {
      _webViewController = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0x00000000))
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              pro.value = progress;
              Get.printInfo(info: 'WebView is loading (progress : $progress%)');
              // Update loading bar.
            },
            onPageStarted: (String url) {
              printInfo(info: 'page start:$url');
            },
            onPageFinished: (String url) async {
              printInfo(info: 'page finished:$url');
              bool isTest = await SharedInfo().isTest;
              final confirmUrl = isTest
                  ? 'buy.spectra.team/result?'
                  : 'buy.soepay.com/result?';
              if (url.contains(confirmUrl)) {
                widget.result = 'success';
              }
            },
            onWebResourceError: (WebResourceError error) {},
            onNavigationRequest: (NavigationRequest request) {
              // if (request.url.contains('/retailer/')) {
              //   String id =
              //       request.url.split('/retailer/').last.split('?').first;

              //   Get.to(
              //     () => ShopDetailPage(userId: id),
              //   );
              //   return NavigationDecision.prevent;
              // }
              printInfo(info: 'onNavigationRequest: ${request.url}');
              return NavigationDecision.navigate;
            },
          ),
        );
      _webViewController.loadRequest(Uri.parse(widget.link ?? ''));
    } catch (e) {}
  }

  final pro = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Get.back(result: widget.result);
            },
          ),
          backgroundColor: KColor.appbarColor,
          title: Text(
            widget.title ?? '',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        body: Column(
          children: [
            // SizedBox(
            //   height: 10,
            // ),
            Obx(
              () => pro.value == 100
                  ? Container()
                  : LinearProgressIndicator(
                      backgroundColor: Colors.white70,
                      value: pro.value / 100,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          KColor.appbarColor),
                    ),
            ),
            Expanded(
                child: WebViewWidget(
              controller: _webViewController,
            ))
          ],
        ));
  }
}
