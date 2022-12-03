// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignIn on _SignIn, Store {
  late final _$isErrorEmailAtom =
      Atom(name: '_SignIn.isErrorEmail', context: context);

  @override
  bool get isErrorEmail {
    _$isErrorEmailAtom.reportRead();
    return super.isErrorEmail;
  }

  @override
  set isErrorEmail(bool value) {
    _$isErrorEmailAtom.reportWrite(value, super.isErrorEmail, () {
      super.isErrorEmail = value;
    });
  }

  late final _$isErrorPasswordAtom =
      Atom(name: '_SignIn.isErrorPassword', context: context);

  @override
  bool get isErrorPassword {
    _$isErrorPasswordAtom.reportRead();
    return super.isErrorPassword;
  }

  @override
  set isErrorPassword(bool value) {
    _$isErrorPasswordAtom.reportWrite(value, super.isErrorPassword, () {
      super.isErrorPassword = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_SignIn.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$authorizationAsyncAction =
      AsyncAction('_SignIn.authorization', context: context);

  @override
  Future<void> authorization() {
    return _$authorizationAsyncAction.run(() => super.authorization());
  }

  late final _$_SignInActionController =
      ActionController(name: '_SignIn', context: context);

  @override
  void setEmail(String email) {
    final _$actionInfo =
        _$_SignInActionController.startAction(name: '_SignIn.setEmail');
    try {
      return super.setEmail(email);
    } finally {
      _$_SignInActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String password) {
    final _$actionInfo =
        _$_SignInActionController.startAction(name: '_SignIn.setPassword');
    try {
      return super.setPassword(password);
    } finally {
      _$_SignInActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isErrorEmail: ${isErrorEmail},
isErrorPassword: ${isErrorPassword},
errorMessage: ${errorMessage}
    ''';
  }
}
