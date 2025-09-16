class Validators {
  static String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return "Full Name is Required";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is Required";
    }
    if (value.endsWith("@gmail.com")) {
      return "Please Enter a Valid Email";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is Required";
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String originalPassword) {
    if (value != originalPassword) {
      return "Password do not Match";
    }
    return null;
  }
}