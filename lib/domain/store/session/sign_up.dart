
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../repos/auth.dart';
import '../../repos/token.dart';
import '../../utils/regular_expressions.dart';
import '../app/core_app.dart';

part 'sign_up.g.dart';

@injectable
class SignUp = _SignUp with _$SignUp;

abstract class _SignUp with Store {
  final AuthRepos _authRepos;
  final TokenRepos _tokenRepos;
  final CoreApp _coreApp;

  _SignUp(this._authRepos, this._tokenRepos, this._coreApp);


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

  @action
  void changeIsOrganization(){
    isOrganization = !isOrganization;
  }

  @observable
  bool isErrorEmail = false;

  @observable
  bool isErrorPassword = false;

  @observable
  bool isOrganization = false;

  @observable
  String? errorMessage;


  @action
  Future<void> registration() async {
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
      // final tokenSet = await _authRepos.getTokenSet(TokenRequest("signin",null, _email,_password));
      // _tokenRepos
      //   ..setAccess(tokenSet.accessToken)
      //   ..setRefresh(tokenSet.refreshToken);
      // final UserStateApp state = UserStateApp.values.singleWhere((element) => element.name == tokenSet.userType);
      // _coreApp.userStateApp = state;
    }on DioError catch(e){
      errorMessage = e.response?.data?.toString();
    }
  }
}
