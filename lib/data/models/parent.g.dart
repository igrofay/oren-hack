// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Parent _$ParentFromJson(Map<String, dynamic> json) => Parent(
      json['fio'] as String,
      json['parentStatus'] as String,
      json['citizenCountry'] as String,
      json['birthday'] as String,
      Passport.fromJson(json['passport'] as Map<String, dynamic>),
      json['address'] as String,
      json['snils'] as String,
      json['phoneNumber'] as String,
      json['email'] as String,
    );

Map<String, dynamic> _$ParentToJson(Parent instance) => <String, dynamic>{
      'fio': instance.fio,
      'parentStatus': instance.parentStatus,
      'citizenCountry': instance.citizenCountry,
      'birthday': instance.birthday,
      'passport': instance.passport,
      'address': instance.address,
      'snils': instance.snils,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
    };
