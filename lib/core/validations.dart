
class Validation {

  static final RegExp emailRegex =
  RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

  static final RegExp phoneRegex = RegExp(r'^\+?[0-9]{1,3}?[-.\s]?[0-9]{1,4}?[-.\s]?[0-9]{4,6}$');

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    } else if (!emailRegex.hasMatch(value)) {
      return "Enter a valid email";
    }
    return null;
  }

  // Method to validate phone number
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number is required";
    } else if (!phoneRegex.hasMatch(value)) {
      return "Enter a valid phone number";
    }
    return null;
  }

  static String? validateEmptyName(String? value) {
    if(value == null || value.isEmpty){
      return "name is requried";
    }
    return null;
  }

}