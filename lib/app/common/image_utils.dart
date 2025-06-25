// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart' as getx;
import 'package:image_picker/image_picker.dart';

import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';

enum PickerType {
  /// Opens up the device camera, letting the user to take a new picture.
  camera,

  /// Opens the user's photo gallery.
  gallery,
}

class ImageUtils {
  static Future<XFile?> imageCompressAndGetFile(XFile file, {flx = 1}) async {
    int fileLength = await file.length();

    if (fileLength < flx * (200 * 1024)) {
      return file;
    }
    var quality = 80;
    if (fileLength > flx * (4 * 1024 * 1024)) {
      quality = 40;
    } else if (fileLength > flx * (2 * 1024 * 1024)) {
      quality = 50;
    } else if (fileLength > flx * (1 * 1024 * 1024)) {
      quality = 60;
    } else if (fileLength > flx * (0.5 * 1024 * 1024)) {
      quality = 70;
    } else if (fileLength > flx * (0.25 * 1024 * 1024)) {
      quality = 75;
    }

    var dir = await getTemporaryDirectory();
    var targetPath =
        "${dir.absolute.path}/${DateTime.now().microsecondsSinceEpoch}.jpg";

    var result = await FlutterImageCompress.compressAndGetFile(
      file.path,
      targetPath,
      minWidth: 300,
      quality: quality,
      rotate: 0,
    );
    fileLength = await result!.length();

    getx.Get.printInfo(info: '壓縮後：--- $fileLength');
    return result;
  }

// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';

  static Future<String> getImage({required String url}) async {
    print('圖片url+ $url');

    /// Get Image from server
    final Response res = await Dio().get<List<int>>(
      url,
      options: Options(
        responseType: ResponseType.bytes,
      ),
    );

    /// Get App local storage
    final Directory appDir = await getApplicationDocumentsDirectory();

    /// Generate Image Name
    final String imageName = url.split('/').last;

    /// Create Empty File in app dir & fill with new image
    final File file = File(join(appDir.path, imageName));

    file.writeAsBytesSync(res.data as List<int>);
    print('圖片url+ $url 下載完成');

    return file.path;
  }

  Future<List<XFile?>?> pickMultiImage({
    PickerType source = PickerType.gallery,
    imageQuality = 49,
  }) async {
    checkPermission(source: source);

    List<XFile?> file = await ImagePicker().pickMultiImage(
      imageQuality: imageQuality,
    );

    return file;
  }

  Future<XFile?> pickerImage({
    PickerType source = PickerType.gallery,
    imageQuality = 49,
  }) async {
    checkPermission(source: source);

    XFile? file = await ImagePicker().pickImage(
      source: ImageSource.values[source.index],
      imageQuality: imageQuality,
    );

    return file;
  }

  Future<XFile?> pickerVideo({
    PickerType source = PickerType.gallery,
    Duration? maxDuration,
  }) async {
    XFile? file = await ImagePicker().pickVideo(
      source: ImageSource.values[source.index],
      maxDuration: maxDuration,
    );

    return file;
  }

  void checkPermission({
    PickerType source = PickerType.gallery,
  }) async {
    bool isPermanentlyDenied = false;
    String titile = '';
    String content = '';
    if (source == PickerType.gallery) {
      titile = '無法訪問相簿'.tr;
      content = '您已關閉相簿訪問許可權，請前往設定中允許相簿許可權2'.tr;
      Map<Permission, PermissionStatus> statues =
          await [Permission.storage, Permission.photos].request();

      PermissionStatus? statusStorage = statues[Permission.storage];
      PermissionStatus? statusPhotos = statues[Permission.photos];
      isPermanentlyDenied =
          statusStorage == PermissionStatus.permanentlyDenied ||
              statusPhotos == PermissionStatus.permanentlyDenied;
    } else if (source == PickerType.camera) {
      titile = '無法開啟相機'.tr;
      content = '您已關閉相機訪問許可權，請前往設定中允許相機許可權1'.tr;
      PermissionStatus status = await Permission.camera.request();
      PermissionStatus? statusCamera = status;
      isPermanentlyDenied = statusCamera == PermissionStatus.permanentlyDenied;
    }

    if (isPermanentlyDenied) {
      showDialog<String>(
        context: getx.Get.context!,
        builder: (BuildContext context) => AlertDialog(
          title: Text(titile),
          content: Text(content),
          actions: <Widget>[
            // if user deny again, we do nothing
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('取消'.tr),
            ),

            // if user is agree, you can redirect him to the app parameters :)
            TextButton(
              onPressed: () async {
                await openAppSettings();
                Navigator.pop(context);
              },
              child: Text('前往相簿'.tr),
            ),
          ],
        ),
      );
    }
  }
}
