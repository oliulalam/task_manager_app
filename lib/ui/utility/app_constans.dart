class AppConstants {
  static RegExp emailRegEx = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  static RegExp mobileRegEx = RegExp(
    r"/(^(\+88|0088)?(01){1}[3456789]{1}(\d){8})$/",
  );
}
