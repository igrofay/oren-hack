// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_app.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CoreApp on _CoreApp, Store {
  late final _$userStateAppAtom =
      Atom(name: '_CoreApp.userStateApp', context: context);

  @override
  UserStateApp get userStateApp {
    _$userStateAppAtom.reportRead();
    return super.userStateApp;
  }

  @override
  set userStateApp(UserStateApp value) {
    _$userStateAppAtom.reportWrite(value, super.userStateApp, () {
      super.userStateApp = value;
    });
  }

  @override
  String toString() {
    return '''
userStateApp: ${userStateApp}
    ''';
  }
}
