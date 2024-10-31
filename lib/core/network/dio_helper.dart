import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';

import '../src/app_export.dart';

abstract class BaseDioHelper {
  Future<dynamic> post({
    String? baseUrl,
    required String endPoint,
    dynamic data,
    dynamic query,
    bool hasToken = false,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  });

  Future<dynamic> patch({
    String? baseUrl,
    required String endPoint,
    dynamic data,
    dynamic query,
    bool hasToken = false,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  });

  Future<dynamic> put({
    String? baseUrl,
    required String endPoint,
    dynamic data,
    dynamic query,
    bool hasToken = false,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  });

  Future<dynamic> get({
    String? baseUrl,
    required String endPoint,
    dynamic data,
    dynamic query,
    bool hasToken = false,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  });

  Future<dynamic> delete({
    String? baseUrl,
    required String endPoint,
    dynamic data,
    dynamic query,
    bool hasToken = false,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  });
}

class DioHelper extends BaseDioHelper {
  Dio _dio() {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: AppEndPoints.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 50),
        receiveTimeout: const Duration(seconds: 50),
      ),
    );

    dio.interceptors.add(
      AwesomeDioInterceptor(),
    );

    return dio;
  }

  static void setTokenAfterLogin(String token) async {
    SharedPreferencesHelper.setSecuredString(
      key: 'token',
      value: token,
    );
  }

  @override
  Future<dynamic> get({
    String? baseUrl,
    required String endPoint,
    dynamic data,
    dynamic query,
    bool hasToken = false,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  }) async {
    final token = await getIt<FlutterSecureStorage>().read(key: 'token');
    return await _dio().get(
      baseUrl == null ? endPoint : baseUrl + endPoint,
      queryParameters: query,
      cancelToken: cancelToken,
      options: Options(
        headers: {
          if (isMultipart) 'Content-Type': 'multipart/form-data',
          if (!isMultipart) 'Content-Type': 'application/json',
          if (!isMultipart) 'Accept': 'application/json',
          if (hasToken) 'authorization': 'Bearer $token',
        },
      ),
    );
  }

  @override
  Future<dynamic> post({
    String? baseUrl,
    required String endPoint,
    dynamic data,
    dynamic query,
    bool hasToken = false,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  }) async {
    final token = await getIt<FlutterSecureStorage>().read(key: 'token');
    return await _dio().post(
      baseUrl == null ? endPoint : baseUrl + endPoint,
      data: data,
      queryParameters: query,
      onSendProgress: progressCallback,
      cancelToken: cancelToken,
      options: Options(
        headers: {
          if (isMultipart) 'Content-Type': 'multipart/form-data',
          if (!isMultipart) 'Content-Type': 'application/json',
          if (!isMultipart) 'Accept': 'application/json',
          if (!isMultipart) 'X-Requested-With': 'XMLHttpRequest',
          if (hasToken) 'authorization': 'Bearer $token',
        },
      ),
    );
  }

  @override
  Future patch({
    String? baseUrl,
    required String endPoint,
    data,
    query,
    bool hasToken = false,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  }) async {
    final token = await getIt<FlutterSecureStorage>().read(key: 'token');
    return await _dio().patch(
      baseUrl == null ? endPoint : baseUrl + endPoint,
      data: data,
      queryParameters: query,
      onSendProgress: progressCallback,
      cancelToken: cancelToken,
      options: Options(
        headers: {
          if (isMultipart) 'Content-Type': 'multipart/form-data',
          if (!isMultipart) 'Content-Type': 'application/json',
          if (!isMultipart) 'Accept': 'application/json',
          if (hasToken) 'authorization': 'Bearer $token',
        },
      ),
    );
  }

  @override
  Future delete({
    String? baseUrl,
    required String endPoint,
    data,
    query,
    bool hasToken = false,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  }) async {
    final token = await getIt<FlutterSecureStorage>().read(key: 'token');
    return await _dio().delete(
      baseUrl == null ? endPoint : baseUrl + endPoint,
      data: data,
      queryParameters: query,
      cancelToken: cancelToken,
      options: Options(
        headers: {
          if (isMultipart) 'Content-Type': 'multipart/form-data',
          if (!isMultipart) 'Content-Type': 'application/json',
          if (!isMultipart) 'Accept': 'application/json',
          if (hasToken) 'authorization': 'Bearer $token',
        },
      ),
    );
  }

  @override
  Future put({
    String? baseUrl,
    required String endPoint,
    data,
    query,
    bool hasToken = false,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  }) async {
    final token = await getIt<FlutterSecureStorage>().read(key: 'token');
    return await _dio().put(
      baseUrl == null ? endPoint : baseUrl + endPoint,
      data: data,
      queryParameters: query,
      onSendProgress: progressCallback,
      cancelToken: cancelToken,
      options: Options(
        headers: {
          if (isMultipart) 'Content-Type': 'multipart/form-data',
          if (!isMultipart) 'Content-Type': 'application/json',
          if (!isMultipart) 'Accept': 'application/json',
          if (hasToken) 'authorization': 'Bearer $token',
        },
      ),
    );
  }
}
