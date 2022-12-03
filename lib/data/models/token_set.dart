import 'package:json_annotation/json_annotation.dart';

part 'token_set.g.dart';

@JsonSerializable()
class TokenSet {

  String grandType;
  String refreshToken;
  String accessToken;
  String userType;
  String username;
  String password;


  TokenSet(this.grandType, this.refreshToken, this.accessToken, this.userType,
      this.username, this.password);

  factory TokenSet.fromJson(Map<String, dynamic> json) =>
      _$TokenSetFromJson(json);

  Map<String, dynamic> toJson() => _$TokenSetToJson(this);
}