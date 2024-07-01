import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimalImageFieldWidget extends ConsumerStatefulWidget {
  const AnimalImageFieldWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<AnimalImageFieldWidget> {
  final titleController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
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
        const Placeholder(
          fallbackHeight: 100.0,
          fallbackWidth: 100.0,
          child: Icon(Icons.image_outlined),
        ),
      ],
    );
  }
}
