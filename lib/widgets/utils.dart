class Utils {
  static bool confirmPassword(String password, String confirmPassword) {
    return password == confirmPassword;
  }
  static bool isValidEmail(String email) {
    // Regular expression for basic email validation
    // This regex allows for most common email formats, but may not cover all edge cases
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
}