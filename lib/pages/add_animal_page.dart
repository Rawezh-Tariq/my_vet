import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_vet/providers/form_fields_controllers_provider.dart';
import 'package:my_vet/providers/form_fields_provider.dart';
import 'package:my_vet/widgets/animal_image_field_widget.dart';
import 'package:my_vet/widgets/animal_info_field_widget.dart';

class AddAnimalPage extends ConsumerStatefulWidget {
  const AddAnimalPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddAnimalPageState();
}

class _AddAnimalPageState extends ConsumerState<AddAnimalPage> {
  @override
  Widget build(BuildContext context) {
    final fields = ref.watch(formFieldsProvider);
    final fieldsNotifier = ref.watch(formFieldsProvider.notifier);
    final titleFieldControllersNotifier =
        ref.watch(titleFieldsControllersProvider.notifier);
    final bodyFieldControllersNotifier =
        ref.watch(bodyFieldsControllersProvider.notifier);

    final titleImageControllersNotifier =
        ref.watch(titleImagesControllersProvider.notifier);

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
                  final fieldIndex = fieldsNotifier.index;
                  titleFieldControllersNotifier
                      .addTitleController(fields.length);
                  bodyFieldControllersNotifier.addBodyController(fields.length);

                  Future.microtask(() {
                    final titleControllers =
                        ref.watch(titleFieldsControllersProvider);
                    final bodyControllers =
                        ref.watch(bodyFieldsControllersProvider);
                    fieldsNotifier.addField(
                      AnimalInfoFieldWidget(
                        titleController: titleControllers[fieldsNotifier.index],
                        bodyController: bodyControllers[fieldsNotifier.index],
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
              TextButton(
                onPressed: () {
                  final fieldIndex = fieldsNotifier.index;
                  titleImageControllersNotifier
                      .addTitleController(fields.length);
                  Future.microtask(() {
                    final titleControllers =
                        ref.watch(titleImagesControllersProvider);
                    fieldsNotifier.addField(
                      AnimalImageFieldWidget(
                        titleController: titleControllers[fieldsNotifier.index],
                        remove: () {
                          fieldsNotifier.removeField(fieldIndex);
                        },
                      ),
                      fieldsNotifier.index,
                    );
                  });
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
