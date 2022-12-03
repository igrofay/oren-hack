
import 'package:dooking/data/models/token_set.dart';
import 'package:dooking/domain/model/token_domain_bean.dart';
import 'package:dooking/domain/model/user_state_app.dart';
import 'package:mobx/mobx.dart';

class TokenMapper {
  static TokenDomainBean fromTokenSet(TokenSet tokenSet) {
    UserStateApp userStateApp;
    switch(tokenSet.userType) {
      case "parent":
        userStateApp = UserStateApp.parent;
        break;
      case "organization":
        userStateApp = UserStateApp.organization;
        break;
      case "misort":
        userStateApp = UserStateApp.minsots;
        break;
      case "administrator":
        userStateApp = UserStateApp.administrator;
        break;
      default:
        userStateApp = UserStateApp.noAuthorized;
        break;
    }

    return TokenDomainBean(
        tokenSet.accessToken,
        tokenSet.refreshToken,
        userStateApp
    );
  }
}