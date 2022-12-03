// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i8;
import 'package:dooking/data/data_source/data_source.dart' as _i4;
import 'package:dooking/data/data_source/rest_client.dart' as _i9;
import 'package:dooking/data/repos/auth_impl.dart' as _i11;
import 'package:dooking/data/repos/token_impl.dart' as _i7;
import 'package:dooking/di/register_module_data_source.dart' as _i15;
import 'package:dooking/domain/repos/auth.dart' as _i10;
import 'package:dooking/domain/repos/token.dart' as _i6;
import 'package:dooking/domain/store/app/core_app.dart' as _i3;
import 'package:dooking/domain/store/session/sign_in.dart' as _i13;
import 'package:dooking/domain/store/session/sign_up.dart' as _i14;
import 'package:dooking/domain/use_case/restore_session.dart' as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
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
    await gh.factoryAsync<_i5.SharedPreferences>(
      () => regModuleDataSource.prefs,
      preResolve: true,
    );
    gh.singleton<_i6.TokenRepos>(
        _i7.TokenReposImpl(gh<_i5.SharedPreferences>()));
    gh.singleton<_i8.Dio>(regModuleDataSource.getDio(
      gh<_i4.DataSource>(),
      gh<_i6.TokenRepos>(),
    ));
    gh.singleton<_i9.RestClient>(
        regModuleDataSource.getRestClient(gh<_i8.Dio>()));
    gh.factory<_i10.AuthRepos>(() => _i11.AuthReposImpl(gh<_i9.RestClient>()));
    gh.singleton<_i12.RestoreSessionUseCase>(_i12.RestoreSessionUseCase(
      gh<_i10.AuthRepos>(),
      gh<_i6.TokenRepos>(),
      gh<_i3.CoreApp>(),
    ));
    gh.factory<_i13.SignIn>(() => _i13.SignIn(
          gh<_i10.AuthRepos>(),
          gh<_i6.TokenRepos>(),
          gh<_i3.CoreApp>(),
        ));
    gh.factory<_i14.SignUp>(() => _i14.SignUp(
          gh<_i10.AuthRepos>(),
          gh<_i6.TokenRepos>(),
          gh<_i3.CoreApp>(),
        ));
    return this;
  }
}

class _$RegModuleDataSource extends _i15.RegModuleDataSource {}
