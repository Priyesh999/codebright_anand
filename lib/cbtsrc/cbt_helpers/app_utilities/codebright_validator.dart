class FormValidtor{
  static String? emailValidator(value) {
    if (value.isEmpty) {
      return 'Please enter your email';
    } else if (!value.contains("@")) {
      return "Enter valid email";
    }else if (!RegExp(
        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
        .hasMatch(value)) {
      return 'Please enter a valid email Address';
    }
    return null;
  }

  static String? passwordValidator(value) {
    if (value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 3) {
      return 'Password must be of greater than 5 character';
    }
    return null;
  }

  static String? nameValidator(value) {
    if (value.isEmpty) {
      return 'Please enter your name';
    } else if (value.length < 2) {
      return 'Name must be of greater than 2 character';
    }
    return null;
  }

  static String? remarkValidator(value) {
    if (value.isEmpty) {
      return 'Please enter your remark';
    } else if (value.length < 3) {
      return 'Remark must be of greater than 3 character';
    }
    return null;
  }

  static String? addressValidator(value) {
    if (value.isEmpty) {
      return 'Please enter your address';
    } else if (value.length < 3) {
      return 'Address must be of greater than 3 character';
    }
    return null;
  }

  static String? hospitalNameValidator(value) {
    if (value.isEmpty) {
      return 'Please enter your hospital name';
    } else if (value.length < 8) {
      return 'Hospital name must be of greater than 8 character';
    }
    return null;
  }

  static String? phoneNumberValidator(value) {
    if (value.isEmpty) {
      return 'Please enter your phone number';
    } else if (value.length < 10) {
      return 'Phone number must be of 10 digit';
    }
    return null;
  }
  
  static String? ageValidator(value) {
    if (value.isEmpty) {
      return 'Please enter your age';
    }

    return null;
  }

}