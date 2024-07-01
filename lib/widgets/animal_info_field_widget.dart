import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimalInfoFieldWidget extends ConsumerStatefulWidget {
  const AnimalInfoFieldWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<AnimalInfoFieldWidget> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      ],
    );
  }
}
