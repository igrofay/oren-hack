

import 'package:dooking/domain/repos/token.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: TokenRepos)
class TokenReposImpl implements TokenRepos{
  final SharedPreferences _sharedPreferences;

  TokenReposImpl(this._sharedPreferences);

  @override
  String getAccess() {
    // TODO: implement getAccess
    throw UnimplementedError();
  }

  @override
  String getRefresh() {
    // TODO: implement getRefresh
    throw UnimplementedError();
  }

  @override
  void setAccess(String access) {
    // TODO: implement setAccess
  }

  @override
  void setRefresh(String refresh) {
    // TODO: implement setRefresh
  }

}