// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'birth_certificate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BirthCertificate _$BirthCertificateFromJson(Map<String, dynamic> json) =>
    BirthCertificate(
      json['isRussian'] as bool,
      json['series'] as int,
      json['number'] as int,
      json['dateOfGetting'] as String,
      json['issueName'] as String,
    );

Map<String, dynamic> _$BirthCertificateToJson(BirthCertificate instance) =>
    <String, dynamic>{
      'isRussian': instance.isRussian,
      'series': instance.series,
      'number': instance.number,
      'dateOfGetting': instance.dateOfGetting,
      'issueName': instance.issueName,
    };
