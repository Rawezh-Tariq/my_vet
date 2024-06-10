import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_vet/providers/value_providers.dart';

class BottomNavigation extends ConsumerWidget {
  final Widget child;
  const BottomNavigation({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNavigationBarValue = ref.watch(bottomNavigationBarProvider);
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavigationBarValue,
        onTap: (value) {
          ref.read(bottomNavigationBarProvider.notifier).state = value;
          switch (value) {
            case 0:
              context.go('/');
              break;
            case 1:
              context.go('/add_animal');
              break;
            case 2:
              context.go('/message');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Animal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: 'Message',
          ),
        ],
      ),
    );
  }
}
