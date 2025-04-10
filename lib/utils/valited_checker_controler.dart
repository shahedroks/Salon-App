class ValitedChecker {
  late bool signChecker = false;
  String? onEmailChecker(String? value) {
    if (value == null || value.isEmpty) {
      return "Email can't be empty";
    }
    if (signChecker) {
      return null;
    }
    String emailPattern =
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'; // Email Checker
    RegExp regex = RegExp(emailPattern);
    if (!value!.endsWith(".com")) {
      return "Use .com";
    }
    if (!value.contains("@")) {
      return "Only Use Email Account";
    }
    if (!regex.hasMatch(value)) {
      return "Enter a valid email";
    }
    return null; // jodi knojhamela na thake
  }

  String? onPasswordChecker(String? value) {
    if (value == null || value.isEmpty) {
      return "Password can't be empty";
    }
    if (signChecker) {
      return null;
    }
    if (value.length < 8) {
      return "Password must be at least 8 characters long";
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return "Password must contain at least one uppercase letter";
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return "Password must contain at least one lowercase letter";
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return "Password must contain at least one number";
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return "Password must contain at least one special character (!@#\$%^&*)";
    }

    return null; // all ok
  }

  String? onNumberChecker(String? value) {
    final RegExp phoneRegex = RegExp(r'^(?:\+88|88)?01[3-9]\d{8}$');
    if (!phoneRegex.hasMatch(value!)) {
      return "Provide Your Valet Number";
    }
    return null;
  }
}
