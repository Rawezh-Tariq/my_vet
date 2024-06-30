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
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final fields = ref.watch(formFieldsProvider);
    final fieldsNotifier = ref.watch(formFieldsProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Animal Page'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  final myIndex = index;
                  fieldsNotifier.addField(
                    AnimalInfoFieldWidget(
                      remove: () {
                        fieldsNotifier.removeField(myIndex);
                        index--;
                      },
                    ),
                    myIndex,
                  );

                  index++;
                },
                child: const Text('Add Field'),
              ),
              TextButton(
                onPressed: () {
                  final myIndex = index;
                  fieldsNotifier.addField(
                    AnimalImageFieldWidget(
                      remove: () {
                        fieldsNotifier.removeField(myIndex);
                      },
                    ),
                    index,
                  );
                  index++;
                },
                child: const Text('Add Image'),
              ),
              ...fields.map(
                (e) => e.field,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
