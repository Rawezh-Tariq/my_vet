import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final titleFieldsControllersProvider = AutoDisposeNotifierProvider<
    TitleFieldsControllersProvider,
    List<TextEditingController>>(TitleFieldsControllersProvider.new);

final bodyFieldsControllersProvider = AutoDisposeNotifierProvider<
    BodyFieldsControllersProvider,
    List<TextEditingController>>(BodyFieldsControllersProvider.new);

final titleImagesControllersProvider = AutoDisposeNotifierProvider<
    TitleImagesControllersProvider,
    List<TextEditingController>>(TitleImagesControllersProvider.new);

class TitleFieldsControllersProvider
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

  void removeTitleController(int index) {
    state = [...state.where((element) => element != state[index])];
    state[index].dispose();
  }
}

class BodyFieldsControllersProvider
    extends AutoDisposeNotifier<List<TextEditingController>> {
  @override
  List<TextEditingController> build() {
    return [];
  }

  void addBodyController(int length) {
    for (int i = 0; i <= length; i++) {
      state = [...state, TextEditingController()];
    }
  }

  void removeBodyController(int index) {
    state = [...state.where((element) => element != state[index])];
    state[index].dispose();
  }
}

class TitleImagesControllersProvider
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

  void removeTitleController(int index) {
    state = [...state.where((element) => element != state[index])];
    state[index].dispose();
  }
}
