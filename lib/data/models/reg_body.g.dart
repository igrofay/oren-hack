// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reg_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegBody _$RegBodyFromJson(Map<String, dynamic> json) => RegBody(
      json['email'] as String,
      json['password'] as String,
      json['isOrganization'] as bool,
    );

Map<String, dynamic> _$RegBodyToJson(RegBody instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'isOrganization': instance.isOrganization,
    };
