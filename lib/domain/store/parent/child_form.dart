

import 'package:dooking/data/models/child.dart';
import 'package:mobx/mobx.dart';

part 'child_form.g.dart';

class ChildForm = _ChildForm with _$ChildForm;

abstract class _ChildForm with Store{
  Child? child;

  _ChildForm(this.child);
}