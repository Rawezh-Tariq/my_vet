import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final validatorProvider =
    NotifierProvider<FormValidator, void>(FormValidator.new);

class FormValidator extends Notifier<void> {
  @override
  void build() {}

  String? nameValidator(String? name) {
    if (name == null || name == '') {
      return 'Please enter your name';
    }
    return null;
  }

  String? phoneValidator(String? phone) {
    if (phone == null || phone == '') {
      return 'Please enter your phone number';
    } else if (phone.contains(RegExp(r'[A-Z a-z]'))) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  String? addressValidator(String? address) {
    if (address == null || address == '') {
      return 'Please select your address';
    }
    return null;
  }

  String? emailValidator(String? email) {
    if (email == null || email == '') {
      return 'Please enter your email';
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? passwordValidator(String? password) {
    if (password == null || password == '') {
      return 'Please enter your password';
    } else if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? verificationIdValidator(String? verificationId) {
    if (verificationId == null || verificationId == '') {
      return 'Please enter your verification id';
    }
    return null;
  }

  bool formSubmit(FormState? formKeyState) {
    return formKeyState?.validate() ?? false;
  }
}
