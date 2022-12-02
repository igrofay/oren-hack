

import 'package:injectable/injectable.dart';

import '../../domain/repos/auth.dart';
import '../data_source/rest_client.dart';

@Injectable(as: AuthRepos)
class AuthReposImpl with AuthRepos{
  final RestClient _restClient;

  AuthReposImpl(this._restClient);

}