import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_vet/pages/add_animal_page.dart';
import 'package:my_vet/pages/greeting_page.dart';
import 'package:my_vet/pages/home_page.dart';
import 'package:my_vet/pages/my_profile_page.dart';
import 'package:my_vet/pages/sign_in_page.dart';
import 'package:my_vet/pages/sign_up_page.dart';
import 'package:my_vet/providers/authevent_listenable_provider.dart';
import 'package:my_vet/providers/auth_provider.dart';
import 'package:my_vet/widgets/bottom_navigation_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final _routerKey = GlobalKey<NavigatorState>();
final _shelRouterKey = GlobalKey<NavigatorState>();
final authState = Supabase.instance.client.auth.onAuthStateChange;
final routerProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    navigatorKey: _routerKey,
    refreshListenable: AuthEventListenable(authState),
    redirect: (context, state) {
      final user = Supabase.instance.client.auth.currentUser;
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
      ShellRoute(
        navigatorKey: _shelRouterKey,
        builder: (context, state, child) {
          return BottomNavigation(child: child);
        },
        routes: [
          GoRoute(
            parentNavigatorKey: _shelRouterKey,
            path: '/',
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            parentNavigatorKey: _shelRouterKey,
            path: '/add_animal',
            builder: (context, state) => const AddAnimalPage(),
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: _routerKey,
        path: '/greeting',
        builder: (context, state) => const GreetingPage(),
      ),
      GoRoute(
        parentNavigatorKey: _routerKey,
        path: '/sign_in',
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        parentNavigatorKey: _routerKey,
        path: '/sign_up',
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        parentNavigatorKey: _routerKey,
        path: '/my_profile',
        builder: (context, state) => const MyProfilePage(),
      ),
    ],
  ),
);
