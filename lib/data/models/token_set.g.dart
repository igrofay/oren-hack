// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenSet _$TokenSetFromJson(Map<String, dynamic> json) => TokenSet(
      json['refreshToken'] as String,
      json['accessToken'] as String,
      json['userType'] as String,
    );

Map<String, dynamic> _$TokenSetToJson(TokenSet instance) => <String, dynamic>{
      'refreshToken': instance.refreshToken,
      'accessToken': instance.accessToken,
      'userType': instance.userType,
    };
