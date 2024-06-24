import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimalImageFieldWidget extends ConsumerWidget {
  final TextEditingController titleController;
  final void Function() remove;
  const AnimalImageFieldWidget({
    super.key,
    required this.titleController,
    required this.remove,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        TextField(
          controller: titleController,
          decoration: const InputDecoration(labelText: 'title'),
        ),
        const Placeholder(
          fallbackHeight: 100.0,
          fallbackWidth: 100.0,
          child: Icon(Icons.image_outlined),
        ),
        TextButton(onPressed: remove, child: const Text('remove')),
      ],
    );
  }
}
