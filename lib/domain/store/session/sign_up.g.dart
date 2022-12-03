// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignUp on _SignUp, Store {
  late final _$isErrorEmailAtom =
      Atom(name: '_SignUp.isErrorEmail', context: context);

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
      Atom(name: '_SignUp.isErrorPassword', context: context);

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

  late final _$isOrganizationAtom =
      Atom(name: '_SignUp.isOrganization', context: context);

  @override
  bool get isOrganization {
    _$isOrganizationAtom.reportRead();
    return super.isOrganization;
  }

  @override
  set isOrganization(bool value) {
    _$isOrganizationAtom.reportWrite(value, super.isOrganization, () {
      super.isOrganization = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_SignUp.errorMessage', context: context);

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

  late final _$registrationAsyncAction =
      AsyncAction('_SignUp.registration', context: context);

  @override
  Future<void> registration() {
    return _$registrationAsyncAction.run(() => super.registration());
  }

  late final _$_SignUpActionController =
      ActionController(name: '_SignUp', context: context);

  @override
  void setEmail(String email) {
    final _$actionInfo =
        _$_SignUpActionController.startAction(name: '_SignUp.setEmail');
    try {
      return super.setEmail(email);
    } finally {
      _$_SignUpActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String password) {
    final _$actionInfo =
        _$_SignUpActionController.startAction(name: '_SignUp.setPassword');
    try {
      return super.setPassword(password);
    } finally {
      _$_SignUpActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsOrganization() {
    final _$actionInfo = _$_SignUpActionController.startAction(
        name: '_SignUp.changeIsOrganization');
    try {
      return super.changeIsOrganization();
    } finally {
      _$_SignUpActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isErrorEmail: ${isErrorEmail},
isErrorPassword: ${isErrorPassword},
isOrganization: ${isOrganization},
errorMessage: ${errorMessage}
    ''';
  }
}
