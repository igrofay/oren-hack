// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AdminStore on _AdminStore, Store {
  late final _$campsAtom = Atom(name: '_AdminStore.camps', context: context);

  @override
  List<Camp> get camps {
    _$campsAtom.reportRead();
    return super.camps;
  }

  @override
  set camps(List<Camp> value) {
    _$campsAtom.reportWrite(value, super.camps, () {
      super.camps = value;
    });
  }

  @override
  String toString() {
    return '''
camps: ${camps}
    ''';
  }
}
