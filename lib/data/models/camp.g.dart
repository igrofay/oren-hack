// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Camp _$CampFromJson(Map<String, dynamic> json) => Camp(
      json['name'] as String,
      json['campType'] as String,
      json['description'] as String,
      (json['shifts'] as List<dynamic>)
          .map((e) => Shift.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['season'] as String,
      json['address'] as String,
      json['infrastructure'] as String,
    );

Map<String, dynamic> _$CampToJson(Camp instance) => <String, dynamic>{
      'name': instance.name,
      'campType': instance.campType,
      'description': instance.description,
      'shifts': instance.shifts,
      'season': instance.season,
      'address': instance.address,
      'infrastructure': instance.infrastructure,
    };
