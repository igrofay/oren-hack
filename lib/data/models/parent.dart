import 'package:json_annotation/json_annotation.dart';

import 'passport.dart';
import 'address.dart';

part 'parent.g.dart';

@JsonSerializable()
class Parent {
  String firstName;
  String secondName;
  String lastName;
  String parentStatus;
  String citizenCountry;
  String birthday;
  Passport passport;
  Address address;
  String snils;
  String phoneNumber;
  String email;
  List<String> childs;


  Parent(
      this.firstName,
      this.secondName,
      this.lastName,
      this.parentStatus,
      this.citizenCountry,
      this.birthday,
      this.passport,
      this.address,
      this.snils,
      this.phoneNumber,
      this.email,
      this.childs);

  factory Parent.fromJson(Map<String, dynamic> json) => _$ParentFromJson(json);

  Map<String, dynamic> toJson() => _$ParentToJson(this);
}