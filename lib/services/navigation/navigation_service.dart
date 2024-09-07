import 'package:flutter/material.dart';
import 'package:giftbox/screens/feed_back_screen.dart';
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
                : const LoginScreen();
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'chatbot',
              builder: (BuildContext context, GoRouterState state) {
                return ChatBotScreen();
              },
            ),
            GoRoute(
                path: 'profile',
                builder: (BuildContext context, GoRouterState state) {
                  return const ProfileScreen();
                }),
            GoRoute(
                path: 'editprofile',
                builder: (BuildContext context, GoRouterState state) {
                  return const EditProfileScreen();
                }),
            GoRoute(
                path: 'settings',
                builder: (BuildContext context, GoRouterState state) {
                  return const SettingsScreen();
                }),
            GoRoute(
                path: 'feedback',
                builder: (BuildContext context, GoRouterState state) {
                  return const FeedbackScreen();
                }),
            GoRoute(
                path: 'themesettings',
                builder: (BuildContext context, GoRouterState state) {
                  return const ThemeSettingScreen();
                }),
            GoRoute(
                path: 'calendar',
                builder: (BuildContext context, GoRouterState state) {
                  return const CalendarScreen();
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

  void goEditProfile() {
    _router.go('/editprofile');
  }

  void goSettings() {
    _router.go('/settings');
  }

  void goFeedback() {
    _router.go('/feedback');
  }

  void goThemeSetting() {
    _router.go('/themesettings');
  }

  void goCalendar() {
    _router.go('/calendar');
  }
}
