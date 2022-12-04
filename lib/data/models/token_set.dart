import 'package:dooking/domain/model/user_state_app.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/model/token_domain_bean.dart';

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

  TokenDomainBean get tokenDomainBean{
    final state = UserStateApp.values.singleWhere((element) => element.name == userType);
    return TokenDomainBean(accessToken,refreshToken,state);
  }
}