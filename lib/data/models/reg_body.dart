import 'package:json_annotation/json_annotation.dart';

part 'reg_body.g.dart';

@JsonSerializable()
class RegBody{
  String email;
  String password;
  bool isOrganization;

  RegBody(this.email, this.password, this.isOrganization);

  factory RegBody.fromJson(Map<String, dynamic> json) => _$RegBodyFromJson(json);
  Map<String, dynamic> toJson() => _$RegBodyToJson(this);
}