import 'package:json_annotation/json_annotation.dart';

part 'childIdResponse.g.dart';

@JsonSerializable()
class ChildIdResponse{
  final int childId;

  ChildIdResponse(this.childId);
  factory ChildIdResponse.fromJson(Map<String, dynamic> json) => _$ChildIdResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChildIdResponseToJson(this);
}