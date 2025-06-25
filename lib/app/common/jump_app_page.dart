import 'package:get/get.dart';
import 'package:tiny_weight/app/common/webview/content_webview.dart';

class JumpAppPage {
  static jumpPage(appPage, pageParams) {
    // // 獲取查詢引數
    // Map<String, List<String>> queryParameters =
    // splitQueryStringAll(pageParams ?? '');
    if (appPage == 'EDITORIAL_POST') {
      Get.to(() => ContentWebView(
            link: pageParams,
            shareWebpageUrl: pageParams,
            isTranslation: false,
          ));
    }
    // } else if (appPage == 'RETAILER_DETAILS') {
    //   Get.to(
    //     () => ShopDetailPage(
    //       userId: queryParameters.containsKey('userId')
    //           ? queryParameters['userId']!.first
    //           : pageParams,
    //     ),
    //   );
    // } else if (appPage == 'RETAILER_LIST') {
    //   Get.to(
    //     SearchShopsPage(
    //       levelList: queryParameters.containsKey('level')
    //           ? queryParameters['level']
    //           : null,
    //       fenlei: queryParameters.containsKey('categoryid')
    //           ? {'catagory_id': queryParameters['categoryid']!.first}
    //           : null,
    //       dibiao: queryParameters.containsKey('landmarkid')
    //           ? {'id': queryParameters['landmarkid']!.first}
    //           : null,
    //     ),
    //   );
    // } else if (appPage == 'EVENT_DETAILS') {
    //   Get.to(
    //     () => VoucherEventDetailPage(
    //       id: queryParameters.containsKey('id')
    //           ? queryParameters['id']!.first
    //           : pageParams,
    //     ),
    //   );
    // } else if (appPage == 'CONTEST_DETAILS') {
    //   Get.to(() => VotePage());
    // } else if (appPage == 'USER_PROFILE') {
    //   Get.to(() => EidtMinePage());
    // }
  }

  static Map<String, List<String>> splitQueryStringAll(String queryString) {
    Map<String, List<String>> queryParameters = {};

    List<String> queryParams = queryString.split('&');
    // printInfo(info: queryParams.first);
    for (var param in queryParams) {
      List<String> keyValue = param.split('=');
      if (keyValue.length == 2) {
        String key = Uri.decodeComponent(keyValue[0]);
        String value = Uri.decodeComponent(keyValue[1]);

        if (queryParameters.containsKey(key)) {
          queryParameters[key]!.add(value);
        } else {
          queryParameters.addAll({
            key: [value]
          });
        }
      }
    }

    return queryParameters;
  }
}
