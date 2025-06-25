// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, library_private_types_in_public_api, empty_catches

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiny_weight/app/widgets/scalable.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tiny_weight/app/config/color.dart';
import 'package:tiny_weight/app/config/path.dart';
import 'package:tiny_weight/app/widgets/toast.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ContentWebView extends StatefulWidget {
  ContentWebView({
    // this.cookieManager,
    this.link,
    this.title,
    this.shareImageUrl,
    this.shareText,
    this.shareWebpageUrl,
    this.isShare = true,
    this.postShareUrl,
    this.id,
    this.isTranslation = true,
  });

  // final CookieManager? cookieManager;
  final String? link;
  String? title;

  String? shareText;
  String? shareImageUrl;
  String? shareWebpageUrl;
  String? postShareUrl;
  String? id;
  bool isShare;
  bool isTranslation;
  @override
  _ContentWebViewState createState() => _ContentWebViewState();
}

class _ContentWebViewState extends State<ContentWebView> {
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
              printInfo(info: '11');
            },
            onPageFinished: (String url) async {
              widget.title = await _webViewController.getTitle();

              if (isFrist == true && widget.isTranslation == true) {
                isFrist = false;
              }
              if (mounted) {
                setState(() {});
              }
            },
            onWebResourceError: (WebResourceError error) {},
            onNavigationRequest: (NavigationRequest request) {
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
        backgroundColor: const Color(0xFFF7F7F7),
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon:
                const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
            onPressed: () => Get.back(),
          ),
          backgroundColor: const Color(0xFFF7F7F7),
          title: Text(
            widget.title ?? '',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: widget.isShare
              ? [
                  IconButton(
                      onPressed: () async {
                        showModalBottomSheet(
                            builder: (BuildContext context) {
                              //構建彈框中的內容
                              return _buildBottomSheetWidget(context);
                            },
                            backgroundColor: Colors.transparent, //重要
                            context: context);
                      },
                      icon: const Icon(Icons.share))
                ]
              : null,
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
                      backgroundColor: const Color(0xFFF7F7F7),
                      value: pro.value / 100,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          KColor.appbarColor),
                    ),
            ),
            Expanded(
                child: WebViewWidget(
              controller: _webViewController,
            )

                // WebViewWidget(
                //   initialUrl: widget.link,
                //   javascriptMode: JavascriptMode.unrestricted,
                //   onPageFinished: (a) async {
                //     widget.title = await _webViewController!.getTitle();
                //     FirebaseAnalytics.instance.logScreenView(
                //       screenName: '瀏覽網頁 - ' + (widget.title ?? ''),
                //     );

                //     if (isFrist == true && widget.isTranslation == true) {
                //       isFrist = false;

                //       var cnlocale = const Locale('zh', 'CN');
                //       var enlocale = const Locale('en', 'US');
                //       var hklocale = const Locale('zh', 'HK'); //
                //       String localeCode = '';
                //       if (Get.locale == cnlocale) {
                //         localeCode = 'zh-CN';
                //       } else if (Get.locale == enlocale) {
                //         localeCode = 'en';
                //       } else if (Get.locale == hklocale) {
                //         // localeCode = 'zh-TW';
                //       }

                //       String? htmlString =
                //           await _webViewController!.runJavascriptReturningResult(
                //         'document.documentElement.innerHTML',
                //       );

                //       printInfo(info: 'htmlString:\n' + htmlString);
                //       int index = htmlString.indexOf('</body>');
                //       String html1 = htmlString.substring(0, index);
                //       String html2 = htmlString.substring(index);

                //       String jsString = '''

                //           <div id="google_translate_element" style="margin: 10vh auto 0;transform: translateY(-50%);line-height:50px
                //               width: 100px;height: 100px;text-align:center;"></div>
                //                               <script type="text/javascript">
                //             function googleTranslateElementinit(){
                //               new google.translate.TranslateElement({pageLanguage : 'zh-TW'},'google_translate_element');

                //             setTimeout(function(){
                //               var select = document.querySelector('select.goog-te-combo');
                //               select.value    = "$localeCode";
                //               select.dispatchEvent(new Event('change'));

                //             },1000)
                //             }
                //           </script>
                //           <script type="text/javascript" src = "https://translate.google.com/translate_a/element.js?cb=googleTranslateElementinit"></script>
                //           <style>
                //           .goog-te-banner-frame.skiptranslate {
                //               display: none !important;
                //           }
                //           body {
                //               top: 0px !important;
                //               bottom:30px;
                //           }
                //           </style>
                //         ''';

                //       String newHtml = html1 + jsString + html2;
                //       _webViewController!.loadHtmlString(newHtml);
                //     }
                //     if (mounted) {
                //       setState(() {});
                //     }
                //   },
                //   onWebViewCreated: (WebViewController webViewController) async {
                //     _controller.complete(webViewController);
                //     _webViewController = webViewController;

                //     if (mounted) {
                //       setState(() {});
                //     }
                //   },
                //   onProgress: (int progress) {
                //     pro.value = progress;
                //     Get.printInfo(
                //         info: 'WebView is loading (progress : $progress%)');
                //   },
                //   // javascriptChannels: <JavascriptChannel>{
                //   //   _toasterJavascriptChannel(context),
                //   // },
                //   navigationDelegate: (NavigationRequest request) {
                //     // print('allowing navigation to $request');
                //     return NavigationDecision.navigate;
                //   },
                //   onPageStarted: (String url) {
                //     // print('Page started loading: $url');
                //   },
                //   gestureNavigationEnabled: true,
                //   backgroundColor: const Color(0x00000000),
                // ),

                )
          ],
        ));
  }

  // JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
  //   return JavascriptChannel(
  //       name: 'Toaster',
  //       onMessageReceived: (JavascriptMessage message) {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text(message.message)),
  //         );
  //       });
  // }

  _buildBottomSheetWidget(context) {
    List datas = [
      {
        'title': 'Facebook',
        'icon': '${base_img_path}icon_facebook_item.png',
      },
      {
        'title': 'WhatsApp',
        'icon': '${base_img_path}icon_whatsapp_item.png',
      },
      /*
      {
        'title': 'Twitter',
        'icon': base_img_path + 'icon_twitter_item.png',
      },
      */
    ];
    /*
    if (widget.shareImageUrl != null) {
      datas.add({
        'title': 'Instagram',
        'icon': base_img_path + 'icon_ins_item.png',
      });
    }
    */

    // List urls = [
    //   base_img_path + 'icon_facebook_item.png',
    //   base_img_path + 'icon_ins_item.png',
    //   base_img_path + 'icon_whatsapp_item.png',
    //   base_img_path + 'icon_twitter_item.png',
    // ];
    // List titles = [
    //   'Facebook',
    //   'Instagram',
    //   'WhatsApp',
    //   'Twitter',
    // ];
//  ImageUtils.getImage(url: headPath ?? ''),
    return Container(
        height: 220,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0))),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Text(
              "Share!".tr,
              style: const TextStyle(
                color: Color(0xFF36393D),
                fontSize: 38,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
                height: 100,
                margin: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: datas
                      .map((e) => _itemCell(e['title'], e['icon']))
                      .toList(),
                )),
          ],
        ));
  }

  Widget _itemCell(title, icon) {
    return ScalableWell(
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 6.0),
              child: Image.asset(
                icon,
                width: 48,
              ),
            ),
            Text(title)
          ],
        ),
      ),
      onTap: () async {
        String sharetext = widget.shareText == null
            ? ('${widget.title!}\n請立即下載 毛孩街APP ${widget.id != null ? 'http://app.wonderfulworld.com/post/item?id=${widget.id ?? ''}' : widget.link ?? ''}')
            : widget.shareText!;
        final result = await Share.share(sharetext, subject: widget.title);
        if (result.status == ShareResultStatus.success) {
          Get.snackbar('提示', '感謝分享');
        }
      },
    );
  }
}
