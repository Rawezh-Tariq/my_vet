import 'package:go_router/go_router.dart';
import 'package:my_vet/pages/greeting_page.dart';
import 'package:my_vet/pages/sign_in_page.dart';
import 'package:my_vet/pages/sign_up_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const GreetingPage(),
    ),
    // GoRoute(
    //   path: '/greeting',
    //   builder: (context, state) => const GreetingPage(),
    // ),
    GoRoute(
      path: '/sign_in',
      builder: (context, state) => const SignInPage(),
    ),
    GoRoute(
      path: '/sign_up',
      builder: (context, state) => const SignUpPage(),
    ),
  ],
);
