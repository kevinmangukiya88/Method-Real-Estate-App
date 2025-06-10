class ValidateInput {

  static bool email(String input) {
    bool isValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(input);
    return isValid;
  }

  static bool password(String input) {
    bool isValid = RegExp(r'^.{8,}$')
        .hasMatch(input);
    return isValid;
  }

  ValidateInput._();
}
