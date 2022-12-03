

import 'package:dio/dio.dart';
import 'package:dooking/data/data_source/rest_client.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/data_source/data_source.dart';
import '../domain/repos/token.dart';

@module
abstract class RegModuleDataSource {

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @singleton
  Dio getDio(DataSource dataSource,TokenRepos tokenRepos) => dataSource.instanceDio(tokenRepos.getAccess);

  @singleton
  RestClient getRestClient(Dio dio) => RestClient(dio);

}