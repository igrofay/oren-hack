
import 'package:dooking/data/models/token_request.dart';
import '../model/token_domain_bean.dart';

abstract class AuthRepos{
  Future<TokenDomainBean> getTokenSet(TokenRequest tokenRequest);
  Future<TokenDomainBean> reg(String email, String password, bool isOrganization);
}