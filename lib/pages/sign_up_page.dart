import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_vet/providers/form_validation_provider.dart';
import 'package:my_vet/providers/location_provider.dart';
import 'package:my_vet/providers/user_role_provider.dart';
import 'package:my_vet/widgets/textfield_widget.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final locationController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final verificationController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    locationController.dispose();
    emailController.dispose();
    passwordController.dispose();
    verificationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final validatorProviderNotifier = ref.watch(validatorProvider.notifier);
    final location = ref.watch(locationProvider.notifier);
    final roleProvider = ref.read(userRoleProvider);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(237, 87, 126, 165),
                ),
              ),
              Image.asset(
                'assets/images/veterinary.png',
                width: 200,
                height: 200,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: const Color.fromARGB(237, 87, 126, 165),
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                width: 320,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFieldWidget(
                        validator: validatorProviderNotifier.nameValidator,
                        controller: nameController,
                        obscureText: false,
                        keyboardType: TextInputType.name,
                        icon: Icons.person_2_outlined,
                        hintText: 'Name',
                      ),
                      const SizedBox(height: 16.0),
                      TextFieldWidget(
                          validator: validatorProviderNotifier.phoneValidator,
                          controller: phoneController,
                          obscureText: false,
                          keyboardType: TextInputType.phone,
                          icon: Icons.phone_enabled_outlined,
                          hintText: 'Phone Number'),
                      const SizedBox(height: 16.0),
                      DropdownButtonFormField(
                        validator: validatorProviderNotifier.locationValidator,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.location_on_outlined),
                        ),
                        icon: const Spacer(),
                        hint: Text(
                          'Location',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        items: [
                          DropdownMenuItem(
                            value: 'slemani',
                            child: Text(
                              'Slemani',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'hawler',
                            child: Text(
                              'Hawler',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            location.state = value;
                          }
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFieldWidget(
                          validator: validatorProviderNotifier.emailValidator,
                          controller: emailController,
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          icon: Icons.email_outlined,
                          hintText: 'Email'),
                      const SizedBox(height: 16.0),
                      TextFieldWidget(
                          validator:
                              validatorProviderNotifier.passwordValidator,
                          controller: passwordController,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          icon: Icons.lock_outline,
                          hintText: 'Password'),
                      const SizedBox(height: 32.0),
                      if (roleProvider == 'doctor' || roleProvider == 'driver')
                        Column(
                          children: [
                            TextFieldWidget(
                                validator:
                                    validatorProviderNotifier.emailValidator,
                                controller: verificationController,
                                obscureText: true,
                                keyboardType: TextInputType.visiblePassword,
                                icon: Icons.verified_outlined,
                                hintText: 'Verification Id'),
                            const SizedBox(height: 32.0),
                          ],
                        ),
                      ElevatedButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          validatorProviderNotifier
                              .formSubmit(formKey.currentState);
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              context.go('/sign_in');
                            },
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                color: Color.fromARGB(237, 87, 126, 165),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              context.go('/');
                            },
                            child: const Text(
                              'back',
                              style: TextStyle(
                                color: Color.fromARGB(237, 87, 126, 165),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
