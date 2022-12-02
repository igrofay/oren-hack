// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:dooking/data/data_source/data_source.dart' as _i4;
import 'package:dooking/data/data_source/register_module.dart' as _i7;
import 'package:dooking/data/data_source/rest_client.dart' as _i6;
import 'package:dooking/domain/store/core_app.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final regModuleDataSource = _$RegModuleDataSource();
    gh.singleton<_i3.CoreApp>(_i3.CoreApp());
    gh.singleton<_i4.DataSource>(
      _i4.DataSource(),
      dispose: (i) => i.dispose(),
    );
    gh.factory<_i5.Dio>(() => regModuleDataSource.getDio(gh<_i4.DataSource>()));
    gh.factory<_i6.RestClient>(
        () => regModuleDataSource.getRestClient(gh<_i5.Dio>()));
    return this;
  }
}

class _$RegModuleDataSource extends _i7.RegModuleDataSource {}
