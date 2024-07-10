class Validators {
  static validateEmail(String value) {
    var pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }

  static String greeting(context) {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return "Good Evening";
    }
    if (hour < 17) {
      return "Good Afternoon";
    }
    return "Good Evening";
  }

  static validatePassword(String value) {
    if (value.length < 6) {
      return "Password must be at least 6 characters long";
    }
    return null;
  }

  static validateEmpty(String value, {String label = 'value'}) {
    if (value.trim().length < 2) {
      return "Enter a valid $label";
    }

    return null;
  }

  static validateLengthGreaterThan(String value, int length) {
    if (value.length > length) {
      return "Should not be longer than $length characters";
    }

    return null;
  }

  static validateLengthLessThan(String value, int length) {
    if (value.length < length) {
      return "Should be $length characters or longer";
    }

    return null;
  }

  static validateIntPhoneNumber(String value) {
    var pattern = r'(^(?:[+][0-9][3])?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return "Enter a valid phone number";
    } else {
      return null;
    }
  }

  static String? validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length < 9) {
      return 'Enter a valid phone number';
    } else if (value.startsWith('+')) {
      return 'Don\'t include your country code.';
    } else {
      return null;
    }
  }



  static validateIsNumeric(String s) {
    if (double.tryParse(s) == null) {
      return "Enter a valid numeric value";
    }

    return null;
  }

  static validateName(String s) {
    if (s.length < 2) {
      return 'Your name should be more than one character long';
    }

    var pattern = r'^[a-z A-Z,.\-]+$';
    RegExp regExp = RegExp(pattern);

    if (!regExp.hasMatch(s)) {
      return 'Enter a valid name';
    }

    return null;
  }

 

  static unCamelCase(s) {
    RegExp exp = RegExp(r"(?=[A-Z])");
    return s != null ? s.split(exp).join(' ') : s;
  }
}

String capitalize(String input) {
  return '${input[0].toUpperCase()}${input.substring(1).toLowerCase()}';
}
