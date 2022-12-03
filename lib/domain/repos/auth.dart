
import 'package:dooking/data/models/token_request.dart';

import '../../data/models/token_set.dart';

abstract class AuthRepos{
  Future<TokenSet> getTokenSet(TokenRequest tokenRequest);
}