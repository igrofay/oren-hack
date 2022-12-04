

import 'package:dio/dio.dart';
import 'package:dooking/data/models/parent.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repos/parent.dart';
import '../data_source/rest_client.dart';

@Injectable(as: ParentRepos)
class ParentReposImpl implements ParentRepos{
  final RestClient _restClient;

  ParentReposImpl(this._restClient);

  @override
  Future<Parent> getParent() async {
    return await _restClient.getParent();
  }

  @override
  Future<void> saveParent(Parent parent) async {
    await _restClient.saveParentProfile(parent);
  }



}