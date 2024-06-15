import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_vet/providers/value_providers.dart';
import 'package:my_vet/widgets/animal_image_field_widget.dart';
import 'package:my_vet/widgets/animal_info_field_widget.dart';

class AddAnimalPage extends ConsumerStatefulWidget {
  const AddAnimalPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddAnimalPageState();
}

class _AddAnimalPageState extends ConsumerState<AddAnimalPage> {
  final titleInfoControllers = <TextEditingController>[];
  final bodyInfoControllers = <TextEditingController>[];
  final titleImageControllers = <TextEditingController>[];

  @override
  void dispose() {
    for (var controller in titleInfoControllers) {
      controller.dispose();
    }
    for (var controller in bodyInfoControllers) {
      controller.dispose();
    }

    for (var controller in titleImageControllers) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fieldCount = ref.watch(fieldCountProvider);
    final imageCount = ref.watch(imageCountProvider);

    for (var index = 0; index < fieldCount; index++) {
      titleInfoControllers.add(TextEditingController());
      bodyInfoControllers.add(TextEditingController());
    }

    for (var index = 0; index < imageCount; index++) {
      titleImageControllers.add(TextEditingController());
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Animal'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              ref.read(fieldCountProvider.notifier).state++;
            },
            child: const Text(
              'Add Field',
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: fieldCount,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (_) {
                    ref.read(fieldCountProvider.notifier).state--;
                    titleInfoControllers.removeAt(index);
                    bodyInfoControllers.removeAt(index);
                  },
                  child: AnimalInfoField(
                    titleController: titleInfoControllers[index],
                    bodyController: bodyInfoControllers[index],
                  ),
                );
              },
            ),
          ),
          const Divider(),
          TextButton(
            onPressed: () {
              ref.read(imageCountProvider.notifier).state++;
            },
            child: const Text(
              'Add Image',
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: imageCount,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (_) {
                    ref.read(imageCountProvider.notifier).state--;
                    titleImageControllers.removeAt(index);
                  },
                  child: AnimalImageField(
                    titleController: titleImageControllers[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
