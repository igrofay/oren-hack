import 'package:json_annotation/json_annotation.dart';

part 'token_request.g.dart';

@JsonSerializable()
class TokenRequest {

  String grandType;
  String? refreshToken;
  String? username;
  String? password;


  TokenRequest(this.grandType, [this.refreshToken, this.username, this.password]);

  factory TokenRequest.fromJson(Map<String, dynamic> json) =>
      _$TokenRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TokenRequestToJson(this);
}