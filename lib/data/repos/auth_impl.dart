

import 'package:dooking/data/models/token_request.dart';
import 'package:dooking/data/models/token_set.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repos/auth.dart';
import '../data_source/rest_client.dart';

@Injectable(as: AuthRepos)
class AuthReposImpl implements AuthRepos{
  final RestClient _restClient;

  AuthReposImpl(this._restClient);

  @override
  Future<TokenSet> getTokenSet(TokenRequest tokenRequest) async {
    return _restClient.auth(tokenRequest);
  }



}