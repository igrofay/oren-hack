import 'package:json_annotation/json_annotation.dart';

part 'token_set.g.dart';

@JsonSerializable()
class TokenSet {

  String refreshToken;
  String accessToken;
  String userType;


  TokenSet(this.refreshToken, this.accessToken, this.userType);

  factory TokenSet.fromJson(Map<String, dynamic> json) =>
      _$TokenSetFromJson(json);

  Map<String, dynamic> toJson() => _$TokenSetToJson(this);
}