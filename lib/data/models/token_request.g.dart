// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenRequest _$TokenRequestFromJson(Map<String, dynamic> json) => TokenRequest(
      json['grantType'] as String,
      json['refreshToken'] as String?,
      json['username'] as String?,
      json['password'] as String?,
    );

Map<String, dynamic> _$TokenRequestToJson(TokenRequest instance) =>
    <String, dynamic>{
      'grantType': instance.grantType,
      'refreshToken': instance.refreshToken,
      'username': instance.username,
      'password': instance.password,
    };
