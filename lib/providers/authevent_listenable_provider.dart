import 'dart:async';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthEventListenable extends ChangeNotifier {
  AuthEventListenable(Stream<AuthState> stream) {
    subscription = stream.listen((data) {
      notifyListeners();
    });
  }
  late final StreamSubscription subscription;

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}
