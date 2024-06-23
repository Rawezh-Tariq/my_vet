import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyFormField {
  final Widget field;
  final int index;
  MyFormField({required this.field, required this.index});
}

class FormFieldsProvider extends Notifier<List<MyFormField>> {
  int index = 0;
  @override
  List<MyFormField> build() {
    return [];
  }

  void addField(Widget field, int index) {
    MyFormField myFormField = MyFormField(field: field, index: index);
    state = [...state, myFormField];
    this.index++;
  }

  void removeField(int index) {
    this.index--;
    state = [...state..removeWhere((element) => element.index == index)];
  }
}

final formFieldsProvider =
    NotifierProvider<FormFieldsProvider, List<MyFormField>>(
        FormFieldsProvider.new);
