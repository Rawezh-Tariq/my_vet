import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimalInfoField extends ConsumerWidget {
  final TextEditingController titleController;
  final TextEditingController bodyController;
  const AnimalInfoField({
    super.key,
    required this.titleController,
    required this.bodyController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(237, 87, 126, 165),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
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
          TextField(
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            style: Theme.of(context).textTheme.bodyMedium,
            controller: bodyController,
            decoration: const InputDecoration(
              hintText: 'body',
            ),
          ),
        ],
      ),
    );
  }
}
