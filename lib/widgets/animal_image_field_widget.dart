import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_vet/providers/image_provider.dart';

class AnimalImageField extends ConsumerWidget {
  final TextEditingController titleController;
  const AnimalImageField({
    super.key,
    required this.titleController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageProvider = ref.watch(imageFileProvider.notifier);

    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          TextField(
            onTapOutside: (_) {
              FocusScope.of(context).unfocus();
            },
            style: Theme.of(context).textTheme.bodyMedium,
            controller: titleController,
            decoration: const InputDecoration(
              hintText: 'title',
            ),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {
              imageProvider.pickImage();
            },
            child: const Text('Select Image'),
          ),
          imageProvider.grtImage != null
              ? Image.file(
                  imageProvider.grtImage!,
                  width: 100,
                  height: 100,
                )
              : Container(),
        ],
      ),
    );
  }
}
