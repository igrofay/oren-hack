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
            print("-----onRequest");
            print("> ${options.uri}");
            print("> ${options.method}");
            print("> ${options.data}");
            print("-----onRequest");
            return handler.next(options);
          },
          onError: (dioError, handler){
            print("-----onError");
            print("> ${dioError.response?.requestOptions.uri}");
            print("> ${dioError.response?.statusCode}");
            print("-----onError");
            return  handler.next(dioError);//continue
          },
          onResponse: (response, handler){
            print("-----onResponse");
            print("> ${response.requestOptions.uri}");
            print("> ${response.statusCode}");
            print("> ${response.data}");
            print("-----onResponse");
            handler.next(response);
          }
      )
    );

  @disposeMethod
  void dispose(){
    _dio.close();
  }
}