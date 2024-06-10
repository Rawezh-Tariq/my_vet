import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_vet/providers/auth_provider.dart';
import 'package:my_vet/providers/form_validation_provider.dart';
import 'package:my_vet/widgets/textfield_widget.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userAuthProvider = ref.watch(authProvider.notifier);
    final validatorProviderNotifier = ref.watch(validatorProvider.notifier);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign In',
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
                          validator: validatorProviderNotifier.emailValidator,
                          controller: emailController,
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          icon: Icons.email_outlined,
                          hintText: 'Email'),
                      const SizedBox(height: 16.0),
                      TextFieldWidget(
                          validator: validatorProviderNotifier.phoneValidator,
                          controller: phoneController,
                          obscureText: false,
                          keyboardType: TextInputType.phone,
                          icon: Icons.phone_enabled_outlined,
                          hintText: 'Phone'),
                      const SizedBox(height: 16.0),
                      TextFieldWidget(
                          validator:
                              validatorProviderNotifier.passwordValidator,
                          controller: passwordController,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          icon: Icons.lock_outline,
                          hintText: 'password'),
                      const SizedBox(height: 32.0),
                      ElevatedButton(
                        onPressed: () {
                          validatorProviderNotifier
                              .formSubmit(formKey.currentState);

                          if (formKey.currentState!.validate()) {
                            userAuthProvider.signIn(
                                email: emailController.text,
                                password: passwordController.text);
                          }
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          context.go('/greeting');
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Color.fromARGB(237, 87, 126, 165),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
