import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_vet/providers/value_providers.dart';
import 'package:my_vet/widgets/animal_info_field_widget.dart';

class AddAnimalPage extends ConsumerStatefulWidget {
  const AddAnimalPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddAnimalPageState();
}

class _AddAnimalPageState extends ConsumerState<AddAnimalPage> {
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
    final fieldCount = ref.watch(fieldCountProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Animal'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  ref.read(fieldCountProvider.notifier).state++;
                },
                child: const Text(
                  'Add Field',
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Add Image',
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: fieldCount,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (_) {
                    ref.read(fieldCountProvider.notifier).state--;
                  },
                  child: AnimalInfoField(
                    titleController: titleController,
                    bodyController: bodyController,
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