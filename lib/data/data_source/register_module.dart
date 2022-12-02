

import 'package:dio/dio.dart';
import 'package:dooking/data/data_source/rest_client.dart';
import 'package:injectable/injectable.dart';

import 'data_source.dart';

@module
abstract class RegModuleDataSource {

  @injectable
  Dio getDio(DataSource dataSource) => dataSource.instanceDio();

  @injectable
  RestClient getRestClient(Dio dio) => RestClient(dio);

}