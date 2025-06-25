import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tiny_weight/app/common/app_helper.dart';
import 'package:tiny_weight/app/common/shared_info.dart';
import 'package:tiny_weight/app/controllers/user_controller.dart';
import 'package:tiny_weight/app/models/dict_model.dart';
import 'package:tiny_weight/app/models/user_info/user_info.dart';

typedef DynamicMap = Map<String, dynamic>;

class ApiService {
  static const String _baseHostUAT = 'http://dev.xxtz.qisiai.top';
  static const String _baseHostProd = 'http://dev.xxtz.qisiai.top';

  static Dio? _dio;
  static var accessToken = '';
  static var refreshToken = '';
  static var uid = '';
  static List<DictModel> dictList = [];
  static final ApiService _instance = ApiService._();
  static final ignoreUrls = [];

  //apis
  static const String loginApi = '/api/v2/auth/phone/login';
  static const String getUserApi = '/api/v2/user/info';
  static const String sendRegisterCodeApi = '/api/v1/auth/send-register-code';
  static const String phoneRegisterApi = '/api/v2/auth/phone/register';
  static const String uploadImageApi = '/api/v1/file/upload';
  static const String updateUserProfileApi = '/api/v2/user/profile';
  static const String updateBodyDataApi = '/api/v2/user/body/data';
  static const String sendPwdCodeApi = '/api/v1/auth/send-pwd-code';
  static const String refreshTokenApi = '/api/v1/auth/refresh-token';
  static const String saveFoodApi = '/api/v1/daily/food/save';
  static const String saveExerciseApi = '/api/v1/daily/exercise/save';
  static const String saveTodayExerciseApi = '/api/v2/today/exercise/record';
  static const String resetPasswordApi = '/api/v1/auth/phone/password/reset';
  static const String generatePlanApi = '/api/v2/user/plan/generate';

  // v2 版本的 API
  static const String getVipPageApi = '/api/v2/vip/page'; // 新增VIP页面API常量
  static const String getRingDataApi = '/api/v2/user/ring/data';
  static const String getNewUserGuideApi =
      '/api/v2/card/new/user/guide'; // 新增 API 常量
  static const String getHomeActivityCardApi =
      '/api/v2/home/config/card'; // 添加首页活动卡片 API 常量
  static const String getTodaySportsApi =
      '/api/v2/home/card/today/sports'; // 添加获取今日运动 API 常量
  static const String getTodayMealApi =
      '/api/v2/top/meal/collection/detail'; // 添加获取今日食谱 API 常量
  static const String getMyCollectApi =
      '/api/v2/user/collect/mine'; // 我的减脂餐 API
  static const String getReduceFatBannerApi =
      '/api/v2/reduce/fat/tab'; // 减脂 banner API
  static const String getHomeCollectCookApi =
      '/api/v2/home/collect/cook'; // 首页用户收藏的食谱专题 API
  static const String get7DaysColariseApi = '/api/v2/card/diet'; // 7天饮食热量 API
  static const String get7DaysDeficitApi = '/api/v2/card/deficit'; // 7天饮食热量缺口
  static const String get7DaysExerciseApi =
      '/api/v2/card/exercise'; // 7天运动热量 API
  static const String getWeightCardApi = '/api/v2/card/weight'; // 体重卡片 API
  static const String buyVIPApi = '/api/v2/user/order'; // 购买VIP API
  static const String getMyCookCollectionApi =
      '/api/v2/user/collect/mine'; // 我的减脂餐 API
  static const String getCollectionDetailApi = '/api/v2/meal/collection/detail';
  static const String getCookbookDetailApi = '/api/v2/cookbook/detail';
  static const String addCookbookApi = '/api/v2/user/add/cookbook';
  static const String addTopMealCollectionApi =
      '/api/v2/top/add/meal/collection';

  static const String removeCookbookApi = '/api/v2/user/remove/cookbook';

  static const String getCookbookListApi = '/api/v2/cookbook/list';
  static const String addJejunitsApi =
      '/api/v2/user/add/jejunitas'; // 添加断食设置 API
  static const String closeJejunitsApi =
      '/api/v2/user/close/jejunitas'; // 添加断食设置 API
  static const String getJejunitsApi =
      '/api/v2/user/jejunitas/plan'; // 获取断食设置 API

  static const String getMealCollectionCategoryApi =
      '/api/v2/meal/collection/category';
  static const String getMealCollectionListApi = '/api/v2/meal/collection/list';
  static const String homepageApi = '/api/v2/home/card/aggregation';
  static const String getHistoryListApi = '/api/v2/history/list';
  static const String getHistoryDetailApi = '/api/v2/history/detail';
  static const String getFatLossPlanApi = '/api/v2/user/plan/info';
  static const String updateFatLossPlanApi = '/api/v2/user/plan/update';
  static const String getRewardStatusApi = '/api/v2/user/new/reward/status';
  static const String claimRewardStatusApi = '/api/v2/user/new/reward/claim';
  static const String getDiscountInfoApi = '/api/v2/user/discount/info';
  static const String saveWeightApi = '/api/v2/daily/weight/save';
  factory ApiService() => _instance;
  ApiService._();

  // 初始化 Dio 的方法
  static Future<void> init() async {
    accessToken = await SharedInfo().accessToken ?? '';
    uid = await SharedInfo().uid ?? '';
    var isTest = await SharedInfo().isTest;
    Get.log('isTest:$isTest');
    _dio = Dio(BaseOptions(
      baseUrl: isTest ? _baseHostUAT : _baseHostProd,
      connectTimeout: 60.seconds,
      receiveTimeout: 60.seconds,
      headers: {'Content-Type': 'application/json'},
      validateStatus: (status) {
        return status! < 500;
      },
      followRedirects: false,
      maxRedirects: 5,
    ));

    // 添加请求拦截器
    _dio!.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        // 在请求头中添加Authorization Token
        if (accessToken.isNotEmpty) {
          options.headers['x-api-token'] = 'Bearer $accessToken';
        }

        if (uid.isNotEmpty) {
          options.headers['x-uid'] = uid;
        }
        // 在请求被发送之前做一些事情
        Get.log("Sending request with ${options.method}: ${options.uri}");
        Get.log("Request headers: ${options.headers}");
        Get.log("Request data: ${options.data}");
        return handler.next(options); // 必须调用next，以继续请求流程
      },
    ));

    // 添加响应拦截器
    _dio!.interceptors.add(InterceptorsWrapper(
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        // 添加重定向URL的日志
        if (response.statusCode == 302) {
          Get.log("Redirect URL: ${response.headers.value('location')}");
        }
        // 在响应被处理之前做一些事情
        Get.log("Received response with status code: ${response.statusCode}");
        // print("Response headers: ${response.headers}");
        // Get.log("Response from: ${response.requestOptions.uri}");

        // 格式化 JSON 数据并打印到控制面
        const JsonEncoder encoder = JsonEncoder.withIndent('  ');
        final String prettyJson = encoder.convert(response.data);
        Get.log(
            "Response data from ${response.requestOptions.path}: $prettyJson");

        // Get.log("Response data: ${response.data}");
        return handler.next(response); // 必须调用next，以继续响应流程
      },
    ));
  }

  void changeProxy(String proxyIp) {
    final adapter = IOHttpClientAdapter();
    adapter.onHttpClientCreate = (HttpClient client) {
      if (proxyIp.isNotEmpty) {
        client.findProxy = (uri) {
          return "PROXY $proxyIp:8888";
        };
      } else {
        client.findProxy = (uri) => "DIRECT";
      }

      return client;
    };
    _dio!.httpClientAdapter = adapter;
  }

  DynamicMap _handleResponse(Response response) {
    try {
      if (response.statusCode == 200) {
        DynamicMap responseData = response.data;
        return {
          'result': responseData['code'],
          'message': responseData['message'],
          'data': responseData['data'],
        };
      } else {
        return {
          'result': response.statusCode,
          'message': '请求出错,请重试:${response.statusCode}', //,
          'data': null,
        };
      }
    } catch (e) {
      return {
        'result': -1,
        'message': 'Error processing response',
        'data': null,
      };
    }
  }

  DynamicMap _networkError(Object error) {
    print('Error sending request: $error');
    return {
      'result': -1,
      'message': '请求出错,请重试.', //'Error sending request: $error',
      'data': null,
    };
  }

  // 例外: 清理Dio实例
  void dispose() {
    _dio?.close();
  }

//清理
  void clean() {
    accessToken = '';
    refreshToken = '';
    uid = '';
  }

  //login
  Future<DynamicMap> login({required String phone, required String pwd}) async {
    try {
      Response response =
          await _dio!.post(loginApi, data: {'phone': phone, 'password': pwd});
      DynamicMap dic = _handleResponse(response);
      if (dic['data'] != null && dic['data'] is Map<String, dynamic>) {
        // 获取'token'键的值
        String? accessT = dic['data']['access_token'];
        String? refreshT = dic['data']['refresh_token'];
        int? expireTime = dic['data']['expires_in'];
        String? uid = dic['data']['uid'];
        if (uid != null) {
          SharedInfo().uid = uid;
          ApiService.uid = uid;
        }
        // 检查是否存在'token'键以及它的值是否不为null
        if (accessT != null) {
          // 将'token'的值转换为字符串
          SharedInfo().accessToken = accessT;
          accessToken = accessT;
          // 现在你可以使用tokenString进行其他操作
        }

        if (refreshT != null) {
          // 将'token'的值转换为字符串
          SharedInfo().refreshtoken = refreshT;
          refreshToken = refreshT;
          // 现在你可以使用tokenString进行其他操作
        }

        if (expireTime != null) {
          SharedInfo().expiresTime =
              DateTime.now().millisecondsSinceEpoch + expireTime * 1000;
        }
      }
      return dic;
    } catch (error) {
      return _networkError(error);
    }
  }

  //获取用户详情
  Future<bool> getUser() async {
    try {
      Response response = await _dio!.get(getUserApi);
      DynamicMap dic = _handleResponse(response);
      if (dic['data'] != null && dic['data'] is DynamicMap) {
        UserInfo user = UserInfo.fromJson(dic['data']);
        await UserController.to.setUserInfo(user);
        if ((user.uid ?? '').isNotEmpty) {
          uid = user.uid ?? '';
          SharedInfo().uid = uid;
        }
        return true;
      }
      return false;
    } catch (error) {
      Get.log('getUser userinfo : error: ${error.toString()}}');
      return false;
    }
  }

  //刷新Token，需要登錄
  Future<bool> refreshMyToken() async {
    final refreshToken = await SharedInfo().refreshtoken;
    if (refreshToken == null || refreshToken.isEmpty) {
      print('refresh token error: refresh token is empty');
      return false;
    }
    try {
      Response response = await _dio!
          .post(refreshTokenApi, data: {'refresh_token': refreshToken});
      DynamicMap dic = _handleResponse(response);
      // print('refresh response:$dic');
      if (dic['data'] != null) {
        // 将'token'的值转换为字符串
        String tokenString = dic['data']['access_token'].toString();
        if (tokenString.isNotEmpty) {
          // 将'token'的值转换为字符串
          SharedInfo().accessToken = tokenString;
          accessToken = tokenString;
          SharedInfo().expiresTime = DateTime.now().millisecondsSinceEpoch +
              dic['data']['expired_in'] * 1000;
        }
        return true;
      } else {
        print('refresh token error: can not find token in data');
        return false;
      }
    } catch (error) {
      print('refresh token error:$error');
      return false;
    }
  }

  Future<DynamicMap> resetPwd(
      String passcode, String password, String phone) async {
    try {
      DynamicMap props = {
        'smsCode': passcode,
        'mobile': phone,
        'password': password,
      };
      Response response = await _dio!
          .put('admin-api/system/user/update-password-by-sms', data: props);
      return _handleResponse(response);
    } catch (error) {
      return _networkError(error);
    }
  }

  // Future<Map<String, dynamic>> uploadMultipleImages(
  //     List<Uint8List> fileBytesList, List<String> fileNames) async {
  //   if (_dio == null) {
  //     throw Exception('Dio instance is not initialized');
  //   }

  //   if (fileBytesList.isEmpty ||
  //       fileNames.isEmpty ||
  //       fileBytesList.length != fileNames.length) {
  //     throw Exception('File data or filenames are invalid');
  //   }

  //   try {
  //     List<MultipartFile> files = [];
  //     for (int i = 0; i < fileBytesList.length; i++) {
  //       files.add(
  //           MultipartFile.fromBytes(fileBytesList[i], filename: fileNames[i]));
  //     }

  //     FormData formData = FormData.fromMap({
  //       'files': files, // 使用数组传递多个文件
  //     });

  //     final Response response = await _dio!.post(
  //       'admin-api/infra/file/uploadFiles',
  //       data: formData,
  //       options: Options(
  //         headers: {
  //           'Authorization': 'Bearer $accessToken',
  //         },
  //         contentType: 'multipart/form-data',
  //       ),
  //     );

  //     return _handleResponse(response);
  //   } on DioException catch (dioError) {
  //     return _networkError(dioError);
  //   } catch (error) {
  //     return _networkError(error);
  //   }
  // }

  Future<DynamicMap> uploadImage(Uint8List fileBytes, String fileName) async {
    try {
      if (fileBytes.isEmpty) {
        throw Exception('File data is empty');
      }

      FormData formData = FormData.fromMap({
        'file': MultipartFile.fromBytes(
          fileBytes,
          filename: fileName,
        ),
      });

      Response response = await _dio!.post(
        uploadImageApi,
        data: formData,
        options: Options(
          headers: {
            'accept': 'application/json',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );
      return _handleResponse(response);
    } catch (error) {
      return _networkError(error);
    }
  }

  // 发送注册验证码
  Future<DynamicMap> sendRegisterCode(String phone) async {
    try {
      Response response = await _dio!.post(
        sendRegisterCodeApi,
        data: {'phone': phone},
      );
      return _handleResponse(response);
    } catch (error) {
      return _networkError(error);
    }
  }

  // 手机号注册
  Future<DynamicMap> phoneRegister({
    required String phone,
    required String password,
    required String code,
  }) async {
    try {
      Response response = await _dio!.post(
        phoneRegisterApi,
        data: {
          'phone': phone,
          'password': password,
          'code': code,
        },
      );
      DynamicMap dic = _handleResponse(response);
      if (dic['data'] != null && dic['data'] is Map<String, dynamic>) {
        // 获取'token'键的值
        String? accessT = dic['data']['access_token'];
        String? refreshT = dic['data']['refresh_token'];
        int? expireTime = dic['data']['expires_in'];
        String? uid = dic['data']['uid'];
        if (uid != null) {
          SharedInfo().uid = uid;
          ApiService.uid = uid;
        }
        // 检查是否存在'token'键以及它的值是否不为null
        if (accessT != null) {
          // 将'token'的值转换为字符串
          SharedInfo().accessToken = accessT;
          accessToken = accessT;
          // 现在你可以使用tokenString进行其他操作
        }

        if (refreshT != null) {
          // 将'token'的值转换为字符串
          SharedInfo().refreshtoken = refreshT;
          refreshToken = refreshT;
          // 现在你可以使用tokenString进行其他操作
        }

        if (expireTime != null) {
          SharedInfo().expiresTime =
              DateTime.now().millisecondsSinceEpoch + expireTime * 1000;
        }
      }
      return _handleResponse(response);
    } catch (error) {
      return _networkError(error);
    }
  }

  // 添加发送修改密码验证码的方法
  Future<DynamicMap> sendPasswordCode(String phone) async {
    try {
      Response response = await _dio!.post(
        sendPwdCodeApi,
        data: {'phone': phone},
      );
      return _handleResponse(response);
    } catch (error) {
      return _networkError(error);
    }
  }

  Future<DynamicMap> updateUserProfile({
    String? avatar, // 改为可选参数 String?
    String? nickname, // 改为可选参数 String?
    int? gender, // 改为可选参数 int?
    String? birthday, // 改为可选参数 String?
    int? fitnessGoal, // 改为可选参数 int?
    int? fitnessRange, // 改为可选参数 int?
    double? wrestline, // 改为可选参数 double?
  }) async {
    try {
      // 构建只包含非 null 参数的请求体
      final Map<String, dynamic> data = {};

      if (avatar != null) data['avatar'] = avatar;
      if (nickname != null) data['nickname'] = nickname;
      if (gender != null) data['gender'] = gender;
      if (birthday != null) data['birthday'] = birthday;
      if (fitnessGoal != null) data['fitness_goal'] = fitnessGoal;
      if (fitnessRange != null) data['fitness_range'] = fitnessRange;
      if (wrestline != null) data['waistline'] = wrestline;
      Response response = await _dio!.post(
        updateUserProfileApi,
        data: data, // 使用构建好的 data Map
      );
      return _handleResponse(response);
    } catch (error) {
      return _networkError(error);
    }
  }

  /// 更新用户身体数据
  /// @param height 身高(cm)，可选
  /// @param currentWeight 当前体重(kg)，可选
  /// @param targetWeight 目标体重(kg)，可选
  /// @param fitnessGoal 健身目标(0-减脂,1-增肌,2-保持)，可选
  /// @param fitnessRange 健身范围(0-全身,1-上半身,2-下半身)，可选
  /// @param dailyExerciseTime 每日运动时间(小时)，可选
  /// @param activityLevel 活动水平(0-久坐,1-轻度活动,2-中度活动,3-重度活动)，可选
  /// @param fastingDays 禁食天数，可选
  /// @return 返回更新结果
  Future<DynamicMap> updateBodyData({
    double? height,
    double? currentWeight,
    double? targetWeight,
    int? fitnessGoal,
    int? fitnessRange,
    int? dailyExerciseTime,
    int? activityLevel,
    int? fastingDays,
  }) async {
    try {
      // 构建只包含非 null 参数的请求体
      final Map<String, dynamic> data = {};

      // 只有当参数不为 null 时才添加到请求体中
      if (height != null) data['height'] = height;
      if (currentWeight != null) data['current_weight'] = currentWeight;
      if (targetWeight != null) data['target_weight'] = targetWeight;
      if (fitnessGoal != null) data['fitness_goal'] = fitnessGoal;
      if (fitnessRange != null) data['fitness_range'] = fitnessRange;
      if (dailyExerciseTime != null)
        data['daily_exercise_time'] = dailyExerciseTime;
      if (activityLevel != null) data['activity_level'] = activityLevel;
      if (fastingDays != null) data['fasting_days'] = fastingDays;

      Response response = await _dio!.post(
        updateBodyDataApi,
        data: data,
      );
      return _handleResponse(response);
    } catch (error) {
      return _networkError(error);
    }
  }

  // 添加重置密码的方法
  Future<DynamicMap> resetPassword({
    required String phone,
    required String password,
    required String code,
  }) async {
    try {
      Response response = await _dio!.post(
        resetPasswordApi,
        data: {
          'phone': phone,
          'password': password,
          'code': code,
        },
      );
      return _handleResponse(response);
    } catch (error) {
      return _networkError(error);
    }
  }

  /// 记录饮食接口
  /// @param mealType 餐食类型 (0: 早餐, 1: 午餐, 2: 晚餐, 3: 夜宵 , 4: 零食, 5: 饮料 , 6: 加餐)
  /// @param question 食物描述
  Future<DynamicMap> saveFood({
    required int mealType,
    required String question,
  }) async {
    try {
      Response response = await _dio!.post(
        saveFoodApi,
        data: {
          'meal_type': mealType,
          'question': question,
        },
      );
      return _handleResponse(response);
    } catch (error) {
      return _networkError(error);
    }
  }

  /// 记录运动接口
  /// @param id
  /// @param question 食物描述
  Future<DynamicMap> saveExercise({
    required int id,
    required String question,
  }) async {
    try {
      Response response = await _dio!.post(
        saveExerciseApi,
        data: {
          'meal_type': id,
          'question': question,
        },
      );
      return _handleResponse(response);
    } catch (error) {
      return _networkError(error);
    }
  }

  /// 记录体重和腰围
  Future<DynamicMap> saveWeight({
    required int type,
    required int value,
  }) async {
    try {
      Response response = await _dio!.post(
        saveWeightApi,
        data: {
          type == 0 ? 'weight' : 'waistline': value,
        },
      );
      return _handleResponse(response);
    } catch (error) {
      return _networkError(error);
    }
  }

  /// 记录运动接口
  /// @param id
  /// @param question 食物描述
  Future<DynamicMap> saveExerciseByUuid({
    required String uuid,
  }) async {
    try {
      Response response = await _dio!.get('$saveTodayExerciseApi?uuid=$uuid');
      return _handleResponse(response);
    } catch (error) {
      return _networkError(error);
    }
  }

  /// 生成减脂计划
  /// @return 返回减脂计划数据
  Future<DynamicMap> generatePlan() async {
    try {
      Response response = await _dio!.get(
        generatePlanApi,
      );
      return _handleResponse(response);
    } catch (error) {
      return _networkError(error);
    }
  }

  /// 获取首页圆环数据
  /// @return 返回首页圆环相关数据
  Future<DynamicMap> getRingData() async {
    try {
      Response response = await _dio!.get(
        getRingDataApi,
      );
      return _handleResponse(response);
    } catch (error) {
      return _networkError(error);
    }
  }

  /// 获取新人引导卡片数据
  /// @return 返回新人引导卡片相关数据
  Future<DynamicMap> getNewUserGuide() async {
    try {
      Response response = await _dio!.get(
        getNewUserGuideApi,
      );
      return _handleResponse(response);
    } catch (error) {
      return _networkError(error);
    }
  }

  /// 获取首页活动卡片数据
  /// @return 返回首页活动卡片相关数据
  Future<DynamicMap> getHomeActivityCard() async {
    try {
      Response response = await _dio!.get(
        getHomeActivityCardApi,
      );
      return _handleResponse(response);
    } catch (error) {
      return _networkError(error);
    }
  }

  /// 获取今日运动数据
  /// @return 返回今日运动相关数据
  Future<DynamicMap> getTodaySports(bool isChange) async {
    try {
      Response response = await _dio!.get(
        '$getTodaySportsApi?change=${isChange ? 1 : 0}',
      );
      return _handleResponse(response);
    } catch (error) {
      return _networkError(error);
    }
  }

  /// 获取今日食谱数据
  /// @return 返回今日食谱相关数据
  Future<DynamicMap> getTodayMeal() async {
    try {
      Response response = await _dio!.get(
        getTodayMealApi,
      );
      return _handleResponse(response);
    } catch (error) {
      return _networkError(error);
    }
  }

  /// 获取指定食谱合集数据
  /// @return 返回指定食谱合集相关数据
  Future<DynamicMap> getCollectionDetail(String id) async {
    try {
      Response response = await _dio!.get(
        '$getCollectionDetailApi?uuid=$id',
      );
      return _handleResponse(response);
    } catch (error) {
      return _networkError(error);
    }
  }

  /// 获取指定食谱数据
  /// @return 返回指定食谱相关数据
  Future<DynamicMap> getCookbookDetail(String id) async {
    try {
      Response response = await _dio!.get(
        '$getCookbookDetailApi?uuid=$id',
      );
      return _handleResponse(response);
    } catch (error) {
      return _networkError(error);
    }
  }

  /// 收藏食谱数据
  Future<DynamicMap> addCookBook(String uuid, String type) async {
    try {
      Response response = await _dio!.get(
        '$addCookbookApi?uuid=$uuid&collect_type=$type',
      );
      return _handleResponse(response);
    } catch (error) {
      return _networkError(error);
    }
  }

  /// 选择置顶食谱
  Future<DynamicMap> addTopMealCollection(String uuid) async {
    try {
      Response response = await _dio!.get(
        '$addTopMealCollectionApi?uuid=$uuid',
      );
      return _handleResponse(response);
    } catch (error) {
      return _networkError(error);
    }
  }

  /// 移除食谱数据
  Future<DynamicMap> removeCookBook(String uuid, String type) async {
    try {
      Response response = await _dio!.get(
        '$removeCookbookApi?uuid=$uuid&collect_type=$type',
      );
      return _handleResponse(response);
    } catch (error) {
      return _networkError(error);
    }
  }

  /// 获取食谱数据
  /// 获取食谱列表
  /// @param page 页码
  /// @param pageSize 每页数量
  /// @param type 类型（可选）
  /// @param cat_id 分类ID（可选，1: 非轻断食食谱, 2: 轻断食食谱）
  Future<DynamicMap> getCookBookList({
    int page = 1,
    int pageSize = 10,
    int? type,
    int? cat_id,
  }) async {
    try {
      final Map<String, dynamic> params = {
        'page': page,
        'page_size': pageSize,
      };
      // 只有在传递时才加入 type 和 cat_id
      if (type != null) params['topic_type'] = type;
      if (cat_id != null) params['cat_id'] = cat_id;

      Response response = await _dio!.get(
        getCookbookListApi,
        queryParameters: params,
      );
      return _handleResponse(response);
    } catch (error) {
      return _networkError(error);
    }
  }

  /// 获取我的减脂餐
  Future<DynamicMap> getMyCollect() async {
    try {
      Response response = await _dio!.get(
        getMyCollectApi,
      );
      return _handleResponse(response);
    } catch (error) {
      return _networkError(error);
    }
  }

  /// 获取减脂 banner 数据
  /// @return 返回减脂 banner 相关数据
  Future<DynamicMap> getReduceFatBanner() async {
    try {
      Response response = await _dio!.get(
        getReduceFatBannerApi,
      );
      return _handleResponse(response);
    } catch (error) {
      return _networkError(error);
    }
  }

  /// 获取首页用户收藏的食谱专题
  /// @return 返回用户收藏的食谱专题数据
  Future<DynamicMap> getHomeCollectCook() async {
    try {
      Response response = await _dio!.get(
        getHomeCollectCookApi,
      );
      return _handleResponse(response);
    } catch (error) {
      return _networkError(error);
    }
  }

  /// 获取七天饮食热量（queryDates为当天日期，lastDays为7，均为写死）
  Future<DynamicMap> getSevenDaysDietCalories() async {
    try {
      // 获取当天日期字符串
      final String todayStr = AppHelper.formatDateKey(DateTime.now());

      Response response = await _dio!.post(
        get7DaysColariseApi,
        data: {
          'query_dates': [todayStr],
          'last_days': 7,
        },
      );
      return _handleResponse(response);
    } catch (error) {
      return _networkError(error);
    }
  }

  //获取饮食热量缺口折线图数据
  Future<DynamicMap> getSevenDaysDietDeficit() async {
    try {
      // 获取当天日期字符串
      final String todayStr = AppHelper.formatDateKey(DateTime.now());

      Response response = await _dio!.post(
        get7DaysDeficitApi,
        data: {
          'query_dates': [todayStr],
          'last_days': 7,
        },
      );
      return _handleResponse(response);
    } catch (error) {
      return _networkError(error);
    }
  }

  //获取运动热量折线图数据
  Future<DynamicMap> getSevenDaysExerciseCalories() async {
    try {
      // 获取当天日期字符串
      final String todayStr = AppHelper.formatDateKey(DateTime.now());

      Response response = await _dio!.post(
        get7DaysExerciseApi,
        data: {
          'query_dates': [todayStr],
          'last_days': 7,
        },
      );
      return _handleResponse(response);
    } catch (error) {
      return _networkError(error);
    }
  }

  /// 获取体重卡片数据
  /// @return 返回体重卡片相关数据
  Future<DynamicMap> getWeightCard() async {
    try {
      // 发送 GET 请求到体重卡片 API
      Response response = await _dio!.get(
        getWeightCardApi,
      );
      // 处理响应并返回统一格式
      return _handleResponse(response);
    } catch (error) {
      // 网络或其他异常处理
      return _networkError(error);
    }
  }

  /// 获取VIP页面信息
  /// @return 返回VIP页面相关数据
  Future<DynamicMap> getVipPageInfo() async {
    try {
      // 这里直接使用静态常量
      Response response = await _dio!.get(
        getVipPageApi,
      );
      return _handleResponse(response);
    } catch (error) {
      return _networkError(error);
    }
  }

  /// 购买会员接口（GET，参数直接拼接在URL后）
  /// @param goodsId 商品ID
  /// @return 返回下单结果
  Future<DynamicMap> buyVip({required int goodsId}) async {
    try {
      // 拼接参数到URL后面
      final url = '$buyVIPApi?goods_id=$goodsId';
      Response response = await _dio!.get(url);
      return _handleResponse(response);
    } catch (error) {
      return _networkError(error);
    }
  }

  /// 获取我的收藏食谱接口
  /// @return 返回我的收藏食谱数据
  Future<DynamicMap> getMyCollectCook() async {
    try {
      Response response = await _dio!.get(
        getMyCookCollectionApi,
      );
      return _handleResponse(response);
    } catch (error) {
      return _networkError(error);
    }
  }

  /// 获取食谱合集分类
  /// @return 返回食谱合集分类数据
  Future<DynamicMap> getMealCollectionCategory() async {
    try {
      Response response = await _dio!.get(
        getMealCollectionCategoryApi,
      );
      return _handleResponse(response);
    } catch (error) {
      return _networkError(error);
    }
  }

  /// 获取食谱合集列表
  /// @param page 页码（必填）
  /// @param pageSize 每页数量（必填）
  /// @param cat_id 分类ID（可选）
  /// @param keywords 关键词（可选）
  Future<DynamicMap> getMealCollectionList({
    required int page,
    int pageSize = 30,
    int? catId,
    String? keywords,
  }) async {
    try {
      final Map<String, dynamic> params = {
        'page': page,
        'page_size': pageSize,
      };
      if (catId != null) params['cat_id'] = catId;
      if (keywords != null && keywords.isNotEmpty) {
        params['keywords'] = keywords;
      }
      Response response = await _dio!.get(
        getMealCollectionListApi,
        queryParameters: params,
      );
      return _handleResponse(response);
    } catch (error) {
      return _networkError(error);
    }
  }

  /// 首页聚合卡片接口
  Future<Map<String, dynamic>> getHomeCardAggregation() async {
    try {
      final response = await _dio!.get(homepageApi);
      return _handleResponse(response);
    } catch (e) {
      return _networkError(e);
    }
  }

  Future<DynamicMap> getHistoryList({
    required String startDate,
    required String endDate,
    required String month,
  }) async {
    try {
      final Map<String, dynamic> params = {
        'start_date': startDate,
        'end_date': endDate,
        'month': month,
      };

      Response response = await _dio!.get(
        getHistoryListApi,
        queryParameters: params,
      );
      return _handleResponse(response);
    } catch (error) {
      return _networkError(error);
    }
  }

  Future<DynamicMap> getHistoryDetail({
    required String date,
  }) async {
    try {
      final Map<String, dynamic> params = {
        'date': date,
      };

      Response response = await _dio!.get(
        getHistoryDetailApi,
        queryParameters: params,
      );
      return _handleResponse(response);
    } catch (error) {
      return _networkError(error);
    }
  }

  Future<DynamicMap> getFatLossPlanInfo() async {
    try {
      final response = await _dio!.get(getFatLossPlanApi);
      return _handleResponse(response);
    } catch (e) {
      return _networkError(e);
    }
  }

  Future<DynamicMap> updateFatLossPlanInfo(DynamicMap param) async {
    try {
      Response response = await _dio!.post(
        updateFatLossPlanApi,
        data: param,
      );
      return _handleResponse(response);
    } catch (error) {
      return _networkError(error);
    }
  }

  /// 添加断食设置
  /// [days] 断食几天（如："2"）
  /// [detail] 断食详情（如："3,5" 表示周三、周五断食，周日是7）

  Future<DynamicMap> addJejunits({
    required int days,
    required List<int> detail,
  }) async {
    // 将List<int>转换为字符串数组
    final detailStr = detail.join(',');
    final url = '$addJejunitsApi?days=$days&detail=[$detailStr]';
    try {
      Response response = await _dio!.get(url);
      return _handleResponse(response);
    } catch (e) {
      return _networkError(e);
    }
  }

  /// 关闭断食设置
  Future<DynamicMap> closeJejunits() async {
    try {
      Response response = await _dio!.get(closeJejunitsApi);
      return _handleResponse(response);
    } catch (e) {
      return _networkError(e);
    }
  }

  /// 获取断食设置
  Future<DynamicMap> getJejunits() async {
    try {
      Response response = await _dio!.get(getJejunitsApi);
      return _handleResponse(response);
    } catch (e) {
      return _networkError(e);
    }
  }

  //获取新人奖励状态
  Future<DynamicMap> getRewardStatus() async {
    try {
      Response response = await _dio!.get(getRewardStatusApi);
      return _handleResponse(response);
    } catch (e) {
      return _networkError(e);
    }
  }

  //领取新人奖励
  Future<DynamicMap> claimRewardStatus() async {
    try {
      Response response = await _dio!.get(claimRewardStatusApi);
      return _handleResponse(response);
    } catch (e) {
      return _networkError(e);
    }
  }

  //获取折扣状态
  Future<DynamicMap> getDiscountInfo() async {
    try {
      Response response = await _dio!.get(getDiscountInfoApi);
      return _handleResponse(response);
    } catch (e) {
      return _networkError(e);
    }
  }
}
