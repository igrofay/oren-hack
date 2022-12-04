// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'children_parent.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChildrenParent on _ChildrenParent, Store {
  late final _$childListAtom =
      Atom(name: '_ChildrenParent.childList', context: context);

  @override
  ObservableList<Child> get childList {
    _$childListAtom.reportRead();
    return super.childList;
  }

  @override
  set childList(ObservableList<Child> value) {
    _$childListAtom.reportWrite(value, super.childList, () {
      super.childList = value;
    });
  }

  late final _$_loadAsyncAction =
      AsyncAction('_ChildrenParent._load', context: context);

  @override
  Future<void> _load() {
    return _$_loadAsyncAction.run(() => super._load());
  }

  @override
  String toString() {
    return '''
childList: ${childList}
    ''';
  }
}
