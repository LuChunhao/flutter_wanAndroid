import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_wanandroid/common/util/logger.dart';
import 'webapi.dart'; //用于配置公用常量

class Http {
  static const String TAG = 'Http>>';
  static Http instance;
//  static String token = "Bearer ClxFbXYhZl6Qm92DmzeWM_R1qb7CIpDvHU08pieMnEYU3SRkbpXnbi8AGuAPr3htfwRwb7kz-87Bhks9YTMUuU1PKpRtDL5oZJFvXW7AO0_Dln_kO6BvER6Fmv8OO8haIhO_Gvghb0sIA5kg9CmVZCnHkEcbn5GAwsbqOq6p3Wu6KqoMORwuIu4704X4Tnt4jMFKcw2mYtonvA-qWPhkvZnNtQI";
  static String token;
  static Dio _dio;
  BaseOptions _options;

  static const int connectTimeout = 10000;
  static const int receiveTimeout = 15000;

  static Http getInstance() {
//    SharedPreferences.getInstance().then((sp){
//      token = sp.get("token");
//    });
    if (instance == null) {
      instance = new Http();
    }
    return instance;
  }

  Http() {
    // 初始化 Options
    _options = new BaseOptions(
      baseUrl: Api.BaseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      headers: {
        //HttpHeaders.userAgentHeader: "Mozilla/5.0",
        HttpHeaders.userAgentHeader: "dio",
        "api": "1.0.0",
        "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
        "Connection": "keep-alive",
        "Accept": "*/*",
      },
      contentType: ContentType.json,
      responseType: ResponseType.plain,
    );

    _dio = new Dio(_options);
    //_dio.interceptors.add(LogInterceptor());
    //发送请求拦截处理，例如：添加token使用

    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      // 在请求被发送之前做一些事情
      LogUtil.d(TAG, '请求接口：${options.baseUrl}${options.path}');
      LogUtil.d(TAG, "请求参数：${options.data}");

//      if (null == token) {
//        LogUtil.d(TAG, "没有token，优先获取token");
//        _dio.lock(); // 锁当前dio
//        Dio tokenDio = new Dio();
//        tokenDio.options.contentType =
//        new ContentType("text", "x-markdown", charset: "utf-8");
//        tokenDio.post(Api.token, data: {
//          "client_id": "276055911742",
//          "client_secret": "326A62D3749A48878748E02F9F8DC637",
//          "grant_type": "client_credentials",
//          "response_type": "token"
//        }).then((data) {
//          LogUtil.d(TAG, "data===$data");
//          String tokenStr = "Bearer " + data.data["access_token"];
//          LogUtil.d(TAG, tokenStr);
//          options.headers["Authorization"] = tokenStr;
//          SharedPreferences.getInstance().then((s) {
//            s.setString("token", tokenStr);
//          });
//          token = tokenStr;
//          return options;
//        }).whenComplete(() => _dio.unlock()); // unlock the dio
//      } else {
//        LogUtil.d(TAG, "token===$token");
//        options.headers["Authorization"] = token;
//        return options;
//      }

      // 如果你想完成请求并返回一些自定义数据，可以返回一个`Response`对象或返回`dio.resolve(data)`。
      // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义数据data.
      //
      // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象，或返回`dio.reject(errMsg)`，
      // 这样请求将被中止并触发异常，上层catchError会被调用。
    }, onResponse: (Response response) {
      // 在返回响应数据之前做一些预处理,比如：解密
      LogUtil.d(TAG, "返回数据：${response.data}");
      return response; // continue
    }, onError: (DioError e) {
      // 当请求失败时做一些预处理
      return e; //continue
    }));
  }

  // get 请求封装
  get(url, {options, cancelToken, data}) async {
    //LogUtil.d(TAG, 'get:::url：$url ,body: $data');
    Response response;
    try {
      //response = await _dio.get(url, data: data, cancelToken: cancelToken);
      response =
      await _dio.get(url, queryParameters: data, cancelToken: cancelToken);
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        LogUtil.d(TAG, 'get请求取消! ' + e.message);
      } else {
        LogUtil.d(TAG, 'get请求发生错误：$e');
      }
    }
    Map<String, dynamic> resultModel = json.decode(response.data);
    return resultModel;
  }

  // post请求封装
  post(url, data, Function callback) async {
    //LogUtil.d(TAG, 'post请求::: url：$url');
    Response response;
    try {
      response = await _dio.post(url,data : data);
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        LogUtil.d(TAG, 'get请求取消! ' + e.message);
      } else {
        LogUtil.d(TAG, 'get请求发生错误：$e');
      }
    }
    return response.data;
  }
}
