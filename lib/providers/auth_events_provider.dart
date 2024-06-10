import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StreamListenable extends ChangeNotifier {
  StreamListenable(Stream<AuthState> stream, Ref ref) {
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
