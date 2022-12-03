// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenSet _$TokenSetFromJson(Map<String, dynamic> json) => TokenSet(
      json['grandType'] as String,
      json['refreshToken'] as String,
      json['accessToken'] as String,
      json['userType'] as String,
      json['username'] as String,
      json['password'] as String,
    );

Map<String, dynamic> _$TokenSetToJson(TokenSet instance) => <String, dynamic>{
      'grandType': instance.grandType,
      'refreshToken': instance.refreshToken,
      'accessToken': instance.accessToken,
      'userType': instance.userType,
      'username': instance.username,
      'password': instance.password,
    };
