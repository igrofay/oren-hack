

import 'package:dooking/data/models/parent.dart';

abstract class ParentRepos{
  Future<Parent> getParent();
  Future<void> saveParent(Parent parent);
}