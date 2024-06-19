import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimalInfoField extends ConsumerStatefulWidget {
  final TextEditingController titleController;
  final TextEditingController bodyController;
  final Function()? remove;
  const AnimalInfoField({
    super.key,
    required this.titleController,
    required this.bodyController,
    required this.remove,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AnimalInfoFieldState();
}

class _AnimalInfoFieldState extends ConsumerState<AnimalInfoField> {
  @override
  Widget build(BuildContext context) {
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
            controller: widget.titleController,
            decoration: const InputDecoration(
              hintText: 'title',
            ),
          ),
          TextField(
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            style: Theme.of(context).textTheme.bodyMedium,
            controller: widget.bodyController,
            decoration: const InputDecoration(
              hintText: 'body',
            ),
          ),
          TextButton(
            onPressed: widget.remove,
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
