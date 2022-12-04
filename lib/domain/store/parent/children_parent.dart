

import 'package:dooking/data/models/child.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../repos/parent.dart';

part 'children_parent.g.dart';

@injectable
class ChildrenParent = _ChildrenParent with _$ChildrenParent;

enum StateChildrenParent{ list, inputForm }

abstract class _ChildrenParent with Store{
  final ParentRepos _parentRepos;

  _ChildrenParent(this._parentRepos){
    _load();
  }

  @observable
  ObservableList<Child> childList = ObservableList();

  @action
  Future<void> _load() async {
    final answer = await _parentRepos.getChildList();
    childList.addAll(answer);
  }



}