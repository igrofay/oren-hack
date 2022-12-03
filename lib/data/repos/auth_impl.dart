

import 'package:dooking/data/models/token_request.dart';
import 'package:dooking/data/models/token_set.dart';
import 'package:dooking/domain/model/token_domain_bean.dart';
import 'package:dooking/domain/model/user_state_app.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repos/auth.dart';
import '../data_source/rest_client.dart';
import '../mappers/TokenMapper.dart';

@Injectable(as: AuthRepos)
class AuthReposImpl implements AuthRepos{
  final RestClient _restClient;

  AuthReposImpl(this._restClient);

  @override
  Future<TokenDomainBean> getTokenSet(TokenRequest tokenRequest) async {
    // return _restClient.auth(tokenRequest);
    return TokenMapper.fromTokenSet(TokenSet("refreshToken", "accessToken", "parent"));
  }



}