import 'package:json_annotation/json_annotation.dart';

import 'passport.dart';

part 'parent.g.dart';

@JsonSerializable()
class Parent {
  String fio;
  String parentStatus;
  String citizenCountry;
  String birthday;
  Passport passport;
  String address;
  String snils;
  String phoneNumber;
  String email;


  Parent(
      this.fio,
      this.parentStatus,
      this.citizenCountry,
      this.birthday,
      this.passport,
      this.address,
      this.snils,
      this.phoneNumber,
      this.email);

  factory Parent.fromJson(Map<String, dynamic> json) => _$ParentFromJson(json);

  Map<String, dynamic> toJson() => _$ParentToJson(this);
}