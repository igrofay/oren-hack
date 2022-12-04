

import 'package:dooking/data/models/child.dart';
import 'package:dooking/domain/store/parent/child_form.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../di/location.dart';
import '../../model/user_state_app.dart';
import '../../repos/parent.dart';
import '../app/core_app.dart';

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
    try{
      final answer = await _parentRepos.getChildList();
      childList.addAll(answer);
    }catch(e){}
  }

  @action
  void addChild(){
    if(getIt.get<CoreApp>().userStateApp == UserStateApp.parent){
      childForm = ChildForm(null, _parentRepos);
      stateChildrenParent = StateChildrenParent.inputForm;
    }
  }

  @action
  void editChild(){
    stateChildrenParent = StateChildrenParent.inputForm;
  }

  ChildForm? childForm;


}