import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimalImageField extends ConsumerWidget {
  final TextEditingController titleController;
  const AnimalImageField({
    super.key,
    required this.titleController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          const SizedBox(height: 16),
          Image.network(
              height: 50,
              'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png')
        ],
      ),
    );
  }
}
