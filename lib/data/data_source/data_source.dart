import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';


@singleton
class DataSource{
  final _urlServer = "";
  late final Dio _dio = Dio()
    ..options = BaseOptions(baseUrl: _urlServer);

  Dio instanceDio() => _dio;

  @disposeMethod
  void dispose(){
    _dio.close();
  }
}