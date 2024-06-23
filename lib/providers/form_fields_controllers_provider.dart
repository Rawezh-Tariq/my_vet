import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormFieldsControllersProvider
    extends AutoDisposeNotifier<List<TextEditingController>> {
  @override
  List<TextEditingController> build() {
    return [];
  }

  void addTitleController(int length) {
    for (int i = 0; i <= length; i++) {
      state = [...state, TextEditingController()];
    }
  }

  void removeController(int index) {
    state = [...state.where((element) => element != state[index])];
  }
}

final formFieldsControllersProvider = AutoDisposeNotifierProvider<
    FormFieldsControllersProvider,
    List<TextEditingController>>(FormFieldsControllersProvider.new);
