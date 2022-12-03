

import 'package:dio/dio.dart';
import 'package:dooking/domain/model/user_state_app.dart';
import 'package:dooking/domain/repos/token.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../data/models/token_request.dart';
import '../model/error.dart';
import '../repos/auth.dart';
import '../store/app/core_app.dart';

@singleton
class RestoreSessionUseCase{
  final AuthRepos _authRepos;
  final TokenRepos _tokenRepos;
  final CoreApp _coreApp;

  RestoreSessionUseCase(this._authRepos, this._tokenRepos, this._coreApp);

  Future<bool> execute() async {
    try{
      final refresh = _tokenRepos.getRefresh();
      final tokenSet = await _authRepos.getTokenSet(TokenRequest("refresh", refresh));
      _tokenRepos
        ..setAccess(tokenSet.accessToken)
        ..setRefresh(tokenSet.refreshToken);
      final UserStateApp state = UserStateApp.values.singleWhere((element) => element.name == tokenSet.userType);
      runInAction(() => _coreApp.userStateApp = state);
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