

import 'package:dooking/domain/repos/token.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: TokenRepos)
class TokenReposImpl implements TokenRepos {
  final SharedPreferences _sharedPreferences;

  TokenReposImpl(this._sharedPreferences);

  static const String _accessTokenKey = "ACCESS_TOKEN_KEY";
  static const String _refreshTokenKey = "ACCESS_TOKEN_KEY";

  @override
  String getAccess() => _sharedPreferences.getString(_accessTokenKey) ?? '';


  @override
  String getRefresh() => _sharedPreferences.getString(_refreshTokenKey) ?? '';

  @override
  void setAccess(String access) {
    _sharedPreferences.setString(_accessTokenKey, access);
  }

  @override
  void setRefresh(String refresh) {
    _sharedPreferences.setString(_refreshTokenKey, refresh);
  }

}