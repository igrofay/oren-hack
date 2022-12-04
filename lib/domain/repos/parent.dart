

import 'package:dooking/data/models/parent.dart';

import '../../data/models/child.dart';

abstract class ParentRepos{
  Future<Parent> getParent();
  Future<void> saveParent(Parent parent);
  Future<List<Child>> getChildList();
  Future<int> putNewChild(Child child);
}