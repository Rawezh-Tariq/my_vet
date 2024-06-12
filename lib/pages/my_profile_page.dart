import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_vet/providers/client_provider.dart';

class MyProfilePage extends ConsumerStatefulWidget {
  const MyProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends ConsumerState<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    final asyncValueUser = ref.watch(clientProvider);
    final user = asyncValueUser.value;
    final loading = asyncValueUser.isLoading;
    final error = asyncValueUser.error;

    if (error != null) {
      Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              context.go('/');
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text('Profile Page'),
        ),
        body: Center(
          child: Text('$error'),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go('/');
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Profile Page'),
      ),
      body: loading
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Loading...'),
                  CircularProgressIndicator(
                    color: Color.fromARGB(237, 87, 126, 165),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  children: [
                    Text('Name: ${user?.name}'),
                    Text('Email: ${user?.email}'),
                    Text('User Role: ${user?.role}'),
                    Text('Phone: ${user?.phone}'),
                    Text('Address: ${user?.address}'),
                  ],
                ),
              ),
            ),
    );
  }
}
