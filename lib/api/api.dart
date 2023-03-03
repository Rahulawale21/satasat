import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../constant/snackbar.dart';
import '../global/session.dart';
import '../global_service/auth.dart';

String developmentDomain = "192.168.1.75:3000";

Future<bool> hasNetwork() async {
  try {
    final result = await InternetAddress.lookup(
        kDebugMode ? developmentDomain : developmentDomain);
    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  } on SocketException catch (_) {
    return false;
  }
}

class API {
  static final API _singleton = API._internal();

  factory API() {
    return _singleton;
  }
  API._internal() {
    dio = Dio(BaseOptions(
      baseUrl: 'http://$developmentDomain/api/',
      connectTimeout: const Duration(seconds: 1000),
      receiveTimeout: const Duration(seconds: 1000),
    ));
    log(dio.options.baseUrl);
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      log(options.uri.toString());
      bool isNetworkAvailable = await hasNetwork();
      if (isNetworkAvailable) {
        return handler.next(options); //continue
      } else {
        hideSnackbar();
        // showSnackbar("Check your internet connection!");
        return handler.next(options);
      }
    }, onResponse: (response, handler) {
      log(response.data.toString());
      return handler.resolve(response);
    }, onError: (DioError e, handler) async {
      log(e.error.toString());
      if (e.response != null) {
        if (e.response!.statusCode == 403) {
          final isData = await refreshToken();
          if (isData) {
            final response = await dio.fetch(
              e.requestOptions.copyWith(
                headers: getHeader(true),
              ),
            );

            return handler.resolve(response);
          } else {
            await AuthService().logout();
          }
        } else {
          return handler.resolve(e.response!);
        }
      } else {
        log(e.response!.data.toString());
        return handler.reject(e);
      }
    }));
  }

  late final Dio dio;

  Future<Response> get({
    required String path,
    Map<String, dynamic>? queryParameters,
    bool useToken = true,
  }) async {
    log(dio.options.baseUrl + path);
    Map<String, dynamic> headers = getHeader(useToken);
    Response response = await dio.get(path,
        options: Options(headers: headers), queryParameters: queryParameters);
    return response;
  }

  refreshToken() async {
    final response = await dio.post(
      "refresh/",
      data: {"refresh": Session.refreshToken},
    );
    if (response.statusCode == 200) {
      Session.accessToken =
          response.data['data']['access_token'] ?? Session.accessToken;
      Session.refreshToken =
          response.data['data']['refresh_token'] ?? Session.refreshToken;
      Session.saveSession();
      return true;
    } else {
      return false;
    }
  }

  Map<String, dynamic> getHeader(bool useToken) {
    if (useToken) {
      log("Bearer ${Session.accessToken}");
      return {"Authorization": "Bearer ${Session.accessToken}"};
    } else {
      return {};
    }
  }

  Future<Response> post({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool useToken = false,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    log(dio.options.baseUrl + path);
    log(data.toString());
    Map<String, dynamic> headers = getHeader(useToken);
    Response response = await dio.post(
      path,
      data: data,
      options: Options(
        headers: headers,
      ),
      queryParameters: queryParameters,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }

  Future<Response> put({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    String contentType = 'multipart/form-data',
    bool useToken = true,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    log(dio.options.baseUrl + path);
    log(data.toString());
    Map<String, dynamic> headers = getHeader(useToken);
    Response response = await dio.put(
      path,
      data: data,
      options: Options(headers: headers, contentType: contentType),
      queryParameters: queryParameters,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }

  Future<Response> patch({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool useToken = false,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    log(dio.options.baseUrl + path);
    log(data.toString());
    Map<String, dynamic> headers = getHeader(useToken);
    Response response = await dio.patch(
      path,
      data: data,
      options: Options(headers: headers),
      queryParameters: queryParameters,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }

  Future<Response> delete({
    required String path,
    Map<String, dynamic>? queryParameters,
    bool useToken = true,
    dynamic data,
  }) async {
    Map<String, dynamic> headers = getHeader(useToken);
    Response response = await dio.delete(
      path,
      options: Options(headers: headers),
      queryParameters: queryParameters,
      data: data,
    );
    return response;
  }
}
