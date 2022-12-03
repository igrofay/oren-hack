// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Child _$ChildFromJson(Map<String, dynamic> json) => Child(
      json['firstName'] as String,
      json['secondName'] as String,
      json['lastName'] as String,
      json['citizenCountry'] as String,
      json['birthday'] as String,
      Passport.fromJson(json['passport'] as Map<String, dynamic>),
      BirthCertificate.fromJson(
          json['birthCertificate'] as Map<String, dynamic>),
      Address.fromJson(json['address'] as Map<String, dynamic>),
      json['snils'] as String,
      json['phoneNumber'] as String,
      json['email'] as String,
    );

Map<String, dynamic> _$ChildToJson(Child instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'secondName': instance.secondName,
      'lastName': instance.lastName,
      'citizenCountry': instance.citizenCountry,
      'birthday': instance.birthday,
      'passport': instance.passport,
      'birthCertificate': instance.birthCertificate,
      'address': instance.address,
      'snils': instance.snils,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
    };
