import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_vet/models/client_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final clientProvider =
    AsyncNotifierProvider<ClientProvider, Client>(ClientProvider.new);

class ClientProvider extends AsyncNotifier<Client> {
  @override
  FutureOr<Client> build() async {
    final supabase = Supabase.instance.client;
    final userId = supabase.auth.currentUser!.id;
    final supabaseUserData =
        await supabase.from('users').select().eq('id', userId);
    final user = supabaseUserData
        .map(
          (e) => Client.fromMap(e),
        )
        .first;
    return user;
  }
}
