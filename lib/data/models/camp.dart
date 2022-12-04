import 'package:json_annotation/json_annotation.dart';

import 'package:dooking/data/models/shift.dart';

part 'camp.g.dart';

@JsonSerializable()
class Camp {
  String name;
  String campType;
  String description;
  List<Shift> shifts;
  String season;
  String address;
  String infrastructure;


  Camp(this.name, this.campType, this.description, this.shifts, this.season,
      this.address, this.infrastructure);

  factory Camp.fromJson(Map<String, dynamic> json) => _$CampFromJson(json);

  Map<String, dynamic> toJson() => _$CampToJson(this);
}