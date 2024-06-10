import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;
final authProvider =
    AsyncNotifierProvider<AuthProvider, void>(AuthProvider.new);

class AuthProvider extends AsyncNotifier<void> {
  @override
  void build() {}
  Future<void> signUp(
      {required String name,
      required String phone,
      required String address,
      required String email,
      required String password,
      required String role,
      required String? verificationId}) async {
    await supabase.auth
        .signUp(
          email: email,
          password: password,
        )
        .then((_) => {
              supabase.auth.signInWithPassword(email: email, password: password)
            });

    await supabase.from('users').insert({
      'name': name,
      'phone': phone,
      'address': address,
      'email': email,
      'password': password,
      'role': role,
      'verification_id': verificationId,
    });
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    await supabase.auth.signInWithPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
  }
}
