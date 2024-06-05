import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_vet/providers/user_role_provider.dart';

class GreetingPage extends ConsumerWidget {
  const GreetingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userRole = ref.watch(userRoleProvider.notifier);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hello, Welcome to My Vet',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16.0),
          Text(
            'this is an application to help you treat your pet in the best possible way.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 100.0),
          Text(
            'Select your user type',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                  fixedSize: WidgetStateProperty.all(const Size(350, 50)),
                ),
            onPressed: () {
              context.go('/sign_up');
              userRole.state = 'client';
            },
            child: const Text(
              'Client',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                  fixedSize: WidgetStateProperty.all(const Size(350, 50)),
                ),
            onPressed: () {
              context.go('/sign_up');
              userRole.state = 'doctor';
            },
            child: const Text(
              'Doctor',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                  fixedSize: WidgetStateProperty.all(const Size(350, 50)),
                ),
            onPressed: () {
              context.go('/sign_up');
              userRole.state = 'driver';
            },
            child: const Text(
              'Driver',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
