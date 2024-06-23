import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_vet/providers/form_fields_controllers_provider.dart';
import 'package:my_vet/providers/form_fields_provider.dart';
import 'package:my_vet/widgets/animal_info_field_widget.dart';

class AddAnimalPage extends ConsumerStatefulWidget {
  const AddAnimalPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddAnimalPageState();
}

class _AddAnimalPageState extends ConsumerState<AddAnimalPage> {
  @override
  @override
  Widget build(BuildContext context) {
    final fields = ref.watch(formFieldsProvider);
    final fieldsNotifier = ref.watch(formFieldsProvider.notifier);
    final fieldIndexProvider = ref.read(formFieldsProvider.notifier).index;
    final fieldControllersNotifier =
        ref.watch(formFieldsControllersProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Animal Page'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  final fieldIndex = fieldIndexProvider;
                  fieldControllersNotifier.addTitleController(fields.length);

                  Future.microtask(() {
                    final fieldControllers =
                        ref.watch(formFieldsControllersProvider);
                    fieldsNotifier.addField(
                      AnimalInfoFieldWidget(
                        titleController: fieldControllers[fieldIndex],
                        bodyController: fieldControllers[fieldIndex],
                        remove: () {
                          fieldsNotifier.removeField(fieldIndex);
                        },
                      ),
                      fieldIndex,
                    );
                  });
                },
                child: const Text('Add Field'),
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
