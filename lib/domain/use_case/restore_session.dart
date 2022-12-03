

import 'package:dio/dio.dart';
import 'package:dooking/domain/repos/token.dart';
import 'package:injectable/injectable.dart';

import '../model/error.dart';
import '../repos/auth.dart';

@singleton
class RestoreSessionUseCase{
  final AuthRepos _authRepos;
  final TokenRepos _tokenRepos;

  RestoreSessionUseCase(this._authRepos, this._tokenRepos);

  Future<bool> execute() async {
    try{
      final access = _tokenRepos.getAccess();
      final tokenSet = _authRepos;

      return true;
    }on DioError catch (e) {
      switch (e.response?.statusCode) {
        case 400:
          return false;
        default:
          throw ConnectionError();
      }
    }
  }
}