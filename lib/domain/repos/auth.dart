
import 'package:dooking/data/models/token_request.dart';

import '../../data/models/token_set.dart';
import '../model/token_domain_bean.dart';

abstract class AuthRepos{
  Future<TokenDomainBean> getTokenSet(TokenRequest tokenRequest);
}