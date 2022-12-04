class Validator {
  static String? validateForm(String? value) {
    if (value == null || value.isEmpty) {
      return "Không để trống !!";
    }
    return null;
  }
}