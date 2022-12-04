

import 'package:dooking/data/models/reg_body.dart';
import 'package:dooking/data/models/token_request.dart';
import 'package:dooking/domain/model/token_domain_bean.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repos/auth.dart';
import '../data_source/rest_client.dart';

@Injectable(as: AuthRepos)
class AuthReposImpl implements AuthRepos{
  final RestClient _restClient;

  AuthReposImpl(this._restClient);

  @override
  Future<TokenDomainBean> getTokenSet(TokenRequest tokenRequest) async {
    return (await _restClient.auth(tokenRequest)).tokenDomainBean;
  }

  @override
  Future<TokenDomainBean> reg(String email, String password, bool isOrganization) async {
    return (
        await _restClient.reg(RegBody(email, password, isOrganization))
    ).tokenDomainBean;
  }



}