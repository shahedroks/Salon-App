String? onEmailChecker(String? value) {
  if (value == null || value.isEmpty) {
    return "Email can't be empty";
  }

  String emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'; // Email Checker
  RegExp regex = RegExp(emailPattern);

  if (!value.endsWith(".com")) {
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
