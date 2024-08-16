import 'package:flutter/material.dart';
import 'package:giftbox/services/repositories/index.dart';
import 'package:go_router/go_router.dart';

import '../../screens/index.dart';

class NavigationService {
  final FirebaseAuthRepository _firebaseAuthRepository;
  late GoRouter _router;

  get router => _router;

  NavigationService(this._firebaseAuthRepository) {
    _initRouter();
  }

  void _initRouter() {
    _router = GoRouter(
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return _firebaseAuthRepository.currentUser != null
                ? const HomeScreen()
                : const LoginScreen(); // Giriş ekranı
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'chatbot',
              builder: (BuildContext context, GoRouterState state) {
                return const ChatBotScreen(); // Ana ekrandan erişilebilecek chatbot ekranı
              },
            ),
            GoRoute(
                path: 'profile',
                builder: (BuildContext context, GoRouterState state) {
                  return const ProfileScreen();
                }),
          ],
        ),
      ],
    );
  }

  void goHome() {
    _router.go('/');
  }

  void goChatBot() {
    _router.go('/chatbot');
  }

  void goProfile() {
    _router.go('/profile');
  }
}
