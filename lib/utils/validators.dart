var emailRegex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

var lowercaseRegExp = RegExp(r'[a-z]');
var uppercaseRegExp = RegExp(r'[A-Z]');
var digitRegExp = RegExp(r'[0-9]');
var specialCharRegExp = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

extension Validators on String? {
  bool isEmailNotValid() {
    return !emailRegex.hasMatch(this!);
  }

  // bool isEmailValid() {
  //   return emailRegex.hasMatch(this!);
  // }

  bool isPasswordLowercase() {
    return !lowercaseRegExp.hasMatch(this!);
  }
  bool isPasswordUppercase() {
    return !uppercaseRegExp.hasMatch(this!);
  }
  bool isPasswordDigit() {
    return !digitRegExp.hasMatch(this!);
  }
  bool isPasswordSpecialChar() {
    return !specialCharRegExp.hasMatch(this!);
  }
}
