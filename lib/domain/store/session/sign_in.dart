import 'package:dio/dio.dart';
import 'package:dooking/data/models/token_request.dart';
import 'package:dooking/domain/repos/auth.dart';
import 'package:dooking/domain/utils/regular_expressions.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../repos/token.dart';
import '../app/core_app.dart';

part 'sign_in.g.dart';

@injectable
class SignIn = _SignIn with _$SignIn;

abstract class _SignIn with Store{
  final AuthRepos _authRepos;
  final TokenRepos _tokenRepos;
  final CoreApp coreApp;

  _SignIn(this._authRepos, this._tokenRepos, this.coreApp);

  String _email = "";
  String _password = "";

  @action
  void setEmail(String email){
    isErrorEmail = false;
    _email = email;
    errorMessage = null;
  }

  @action
  void setPassword(String password){
    isErrorPassword = false;
    _password = password;
    errorMessage = null;
  }

  @observable
  bool isErrorEmail = false;

  @observable
  bool isErrorPassword = false;

  @observable
  String? errorMessage;


  @action
  Future<void> authorization() async {
    try{
      isErrorEmail = ! isEmail(_email);
      if(isErrorEmail){
        errorMessage = "Неверная почта";
        return;
      }
      isErrorPassword = ! isPassword(_password);
      if(isErrorPassword){
        errorMessage = "Неверный пароль";
        return;
      }
      final tokenSet = await _authRepos.getTokenSet(TokenRequest("signin",null, _email,_password));
      _tokenRepos
        ..setAccess(tokenSet.accessToken)
        ..setRefresh(tokenSet.refreshToken);
      coreApp.userStateApp = tokenSet.userState;
    }on DioError catch(e){
      errorMessage = e.response?.data?.toString();
    }
  }

}