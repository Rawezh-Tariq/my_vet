import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_vet/providers/form_fields_provider.dart';
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
    final fieldList = ref.watch(formFieldsProvider);
    final formFieldProvider = ref.read(formFieldsProvider.notifier);

    for (var i = 0; i <= fieldList.length; i++) {
      titleInfoControllers.add(TextEditingController());
      bodyInfoControllers.add(TextEditingController());
      titleImageControllers.add(TextEditingController());
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Animal'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  formFieldProvider.addField(AnimalInfoField(
                    titleController: titleInfoControllers[fieldList.length],
                    bodyController: bodyInfoControllers[fieldList.length],
                    remove: formFieldProvider.removeField,
                    key: UniqueKey(),
                  ));
                },
                child: const Text(
                  'Add Text Field',
                ),
              ),
              TextButton(
                onPressed: () {
                  formFieldProvider.addField(AnimalImageField(
                    titleController: titleImageControllers[fieldList.length],
                  ));
                },
                child: const Text(
                  'Add Image Field',
                ),
              ),
              ...fieldList,
            ],
          ),
        ),
      ),
    );
  }
}
