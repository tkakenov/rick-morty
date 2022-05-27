import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioSettings {
  DioSettings() {
    setup();
  }

  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://rickandmortyapi.com/api/',
      connectTimeout: 25000,
      receiveTimeout: 25000,
    ),
  );

  void setup() {
    final headerInterceptor = QueuedInterceptorsWrapper(
      onResponse: (e, handler) {
        return handler.next(e);
      },
      onError: (e, handler) {
        return handler.next(e);
      },
      onRequest: (options, handler) {
        return handler.next(options);
      },
    );

    final interceptors = dio.interceptors;

    interceptors.clear();

    final logInterceptor = LogInterceptor(
      responseHeader: true,
      error: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
    );

    interceptors.addAll([
      headerInterceptor,
      if (kDebugMode) logInterceptor,
    ]);
  }
}
