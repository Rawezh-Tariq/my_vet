import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimalInfoFieldWidget extends ConsumerWidget {
  final TextEditingController titleController;
  final TextEditingController bodyController;
  final void Function() remove;
  const AnimalInfoFieldWidget({
    super.key,
    required this.titleController,
    required this.bodyController,
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
        TextField(
          controller: bodyController,
          decoration: const InputDecoration(labelText: 'body'),
        ),
        TextButton(onPressed: remove, child: const Text('remove')),
      ],
    );
  }
}
