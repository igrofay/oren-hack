import 'package:dooking/data/models/birth_certificate.dart';
import 'package:json_annotation/json_annotation.dart';

import 'passport.dart';
import 'address.dart';

part 'child.g.dart';

@JsonSerializable()
class Child {
  String firstName;
  String secondName;
  String lastName;
  String citizenCountry;
  String birthday;
  Passport passport;
  BirthCertificate birthCertificate;
  Address address;
  String snils;
  String phoneNumber;
  String email;


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
      this.email);

  factory Child.fromJson(Map<String, dynamic> json) => _$ChildFromJson(json);

  Map<String, dynamic> toJson() => _$ChildToJson(this);
}