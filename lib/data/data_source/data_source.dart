import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

typedef GetAccessToken = String Function();

@singleton
class DataSource{
  final _urlServer = "";
  late final Dio _dio = Dio()
    ..options = BaseOptions(baseUrl: _urlServer);


  Dio instanceDio(GetAccessToken getAccessToken) => _dio
    ..interceptors.add(
        InterceptorsWrapper(
          onRequest:(options, handler){
            options.headers[HttpHeaders.authorizationHeader] = "Bearer ${getAccessToken()}";
            return handler.next(options);
          }
      )
    );

  @disposeMethod
  void dispose(){
    _dio.close();
  }
}