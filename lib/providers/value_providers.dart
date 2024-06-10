import 'package:flutter_riverpod/flutter_riverpod.dart';

final fieldCountProvider = StateProvider<int>((ref) => 0);

final addressProvider = StateProvider<String>((ref) => '');

final bottomNavigationBarProvider = StateProvider<int>((ref) => 0);

final userRoleProvider = StateProvider<String>((ref) => '');
