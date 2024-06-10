import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_vet/pages/greeting_page.dart';
import 'package:my_vet/pages/home_page.dart';
import 'package:my_vet/pages/sign_in_page.dart';
import 'package:my_vet/pages/sign_up_page.dart';
import 'package:my_vet/providers/auth_events_provider.dart';
import 'package:my_vet/providers/auth_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final user = Supabase.instance.client.auth.currentUser;
final authState = Supabase.instance.client.auth.onAuthStateChange;
final routerProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    refreshListenable: StreamListenable(authState, ref),
    redirect: (context, state) {
      supabase.auth.onAuthStateChange.listen((data) {
        final AuthChangeEvent event = data.event;
        if (event == AuthChangeEvent.signedIn &&
            state.matchedLocation == '/sign_in') {
          ref.invalidateSelf();
        }
      });

      if (user == null && state.matchedLocation == '/') {
        return '/sign_in';
      } else if (user != null &&
          state.matchedLocation == '/sign_in' &&
          state.matchedLocation == '/sign_up') {
        return '/';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/greeting',
        builder: (context, state) => const GreetingPage(),
      ),
      GoRoute(
        path: '/sign_in',
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: '/sign_up',
        builder: (context, state) => const SignUpPage(),
      ),
    ],
  ),
);
