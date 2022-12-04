import 'package:dooking/data/models/birth_certificate.dart';
import 'package:json_annotation/json_annotation.dart';

import 'passport.dart';

part 'child.g.dart';

@JsonSerializable()
class Child {
  String firstName;
  String secondName;
  String lastName;
  String citizenCountry;
  String birthday;
  Passport? passport;
  BirthCertificate? birthCertificate;
  String address;
  String snils;
  String phoneNumber;
  int? id;


  Child(
      this.firstName,
      this.secondName,
      this.lastName,
      this.citizenCountry,
      this.birthday,
      this.passport,
      this.birthCertificate,
      this.address,
      this.snils,
      this.phoneNumber,
      this.id);

  String get fio => "$secondName $firstName $lastName";

  factory Child.fromJson(Map<String, dynamic> json) => _$ChildFromJson(json);

  Map<String, dynamic> toJson() => _$ChildToJson(this);
}