import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final imageFileProvider =
    AsyncNotifierProvider<ImageProvider, File?>(ImageProvider.new);

class ImageProvider extends AsyncNotifier<File?> {
  @override
  File? build() {
    return null;
  }

  Future<void> pickImage() async {
    final imageXFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (imageXFile != null) {
      state = AsyncValue.data(File(imageXFile.path));
    } else {
      state = const AsyncValue.data(null);
    }
  }

  File? get grtImage {
    return state.value;
  }
}
