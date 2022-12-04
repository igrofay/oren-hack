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
      json['passport'] == null
          ? null
          : Passport.fromJson(json['passport'] as Map<String, dynamic>),
      json['birthCertificate'] == null
          ? null
          : BirthCertificate.fromJson(
              json['birthCertificate'] as Map<String, dynamic>),
      json['address'] as String,
      json['snils'] as String,
      json['phoneNumber'] as String,
      json['email'] as String,
      json['id'] as int?,
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
      'id': instance.id,
    };
