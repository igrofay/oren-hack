
import 'package:dooking/domain/model/user_state_app.dart';


class TokenDomainBean{
  String accessToken;
  String refreshToken;
  UserStateApp userState;

  TokenDomainBean(this.accessToken, this.refreshToken, this.userState);
}