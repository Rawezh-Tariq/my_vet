import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormValidator extends Notifier<String?> {
  @override
  String? build() {
    return null;
  }

  String? emailValidator(String? email) {
    if (email == null || !email.contains('@gmail.com')) {
      state = 'Please enter your email';
      return state;
    }
    return null;
  }

  void formSubmit(formKeyState) {
    if (formKeyState.validate() ?? false) {
      state = null;
    }
  }
}

final validatorProvider =
    NotifierProvider<FormValidator, String?>(FormValidator.new);
