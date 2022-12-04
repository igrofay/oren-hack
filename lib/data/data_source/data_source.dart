import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

typedef GetAccessToken = String Function();

@singleton
class DataSource{
  final _urlServer = "http://192.168.0.103:8080";
  late final Dio _dio = Dio()
    ..options = BaseOptions(baseUrl: _urlServer);


  Dio instanceDio(GetAccessToken getAccessToken) => _dio
    ..interceptors.add(
        InterceptorsWrapper(
          onRequest:(options, handler){
            options.headers[HttpHeaders.authorizationHeader] = "Bearer ${getAccessToken()}";
            print("-----");
            print("> ${options.uri}");
            print("> ${options.method}");
            print("> ${options.data}");
            print("-----");
            return handler.next(options);
          },
          onError: (dioError, handler){
            print("-----");
            print("> ${dioError.response?.requestOptions.uri}");
            print("> ${dioError.response?.statusCode}");
            print("-----");
            return  handler.next(dioError);//continue
          }
      )
    );

  @disposeMethod
  void dispose(){
    _dio.close();
  }
}