import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormFieldsProvider extends Notifier<List<Widget>> {
  @override
  List<Widget> build() {
    return [];
  }

  void addField(Widget field) {
    state = [...state, field];
  }

  void removeField() {
    state = [
      ...state..removeWhere((element) => element.key == state.last.key),
    ];
  }
}

final formFieldsProvider =
    NotifierProvider<FormFieldsProvider, List<Widget>>(FormFieldsProvider.new);
