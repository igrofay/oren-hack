

import 'package:dooking/data/models/child.dart';
import 'package:dooking/domain/store/parent/child_form.dart';
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
  StateChildrenParent stateChildrenParent = StateChildrenParent.list;

  @observable
  ObservableList<Child> childList = ObservableList();

  @action
  Future<void> _load() async {
    final answer = await _parentRepos.getChildList();
    childList.addAll(answer);
  }

  @action
  void addChild(){
    stateChildrenParent = StateChildrenParent.inputForm;
  }

  @action
  void editChild(){
    stateChildrenParent = StateChildrenParent.inputForm;
  }

  ChildForm? childForm;


}