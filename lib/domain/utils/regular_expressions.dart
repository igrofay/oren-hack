bool isEmail(String em) {
  String emailRegexp =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(emailRegexp);
  return regExp.hasMatch(em);
}

bool isPassword(String password){
  String passwordRegexp =
      r'^([A-z0-9!@\#$%\^&*\(\)\.\,-]){6,32}$';
  RegExp regExp = RegExp(passwordRegexp);
  return regExp.hasMatch(password);
}