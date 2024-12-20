import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:giftbox/screens/feed_back_screen.dart';
import 'package:giftbox/services/repositories/index.dart';
import 'package:go_router/go_router.dart';

import '../../features/homeview/history_detail.dart';
import '../../screens/index.dart';
import '../models/firestore/index.dart';

class NavigationService {
  final FirebaseAuthRepository _firebaseAuthRepository;
  late GoRouter _router;

  GoRouter get router => _router;

  NavigationService(this._firebaseAuthRepository) {
    _initRouter();

    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        goHome();
      } else {
        goLogin();
      }
    });
  }

  void _initRouter() {
    _router = GoRouter(
      initialLocation: '/',
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
              path: 'login',
              builder: (BuildContext context, GoRouterState state) {
                return const LoginScreen();
              },
            ),
            GoRoute(
              path: 'chatbot',
              builder: (BuildContext context, GoRouterState state) {
                return const ChatBotScreen();
              },
            ),
            GoRoute(
              path: 'category',
              builder: (BuildContext context, GoRouterState state) {
                return const CategorySelectionScreen();
              },
            ),
            GoRoute(
              path: 'profile',
              builder: (BuildContext context, GoRouterState state) {
                return const ProfileScreen();
              },
            ),
            GoRoute(
              path: 'editprofile',
              builder: (BuildContext context, GoRouterState state) {
                return const EditProfileScreen();
              },
            ),
            GoRoute(
              path: 'settings',
              builder: (BuildContext context, GoRouterState state) {
                return const SettingsScreen();
              },
            ),
            GoRoute(
              path: 'feedback',
              builder: (BuildContext context, GoRouterState state) {
                return const FeedbackScreen();
              },
            ),
            GoRoute(
              path: 'themesettings',
              builder: (BuildContext context, GoRouterState state) {
                return const ThemeSettingScreen();
              },
            ),
            GoRoute(
              path: 'calendar',
              builder: (BuildContext context, GoRouterState state) {
                return const CalendarScreen();
              },
            ),
            GoRoute(
              path: 'historydetail',
              builder: (BuildContext context, GoRouterState state) {
                final args = state.extra as Map<String, dynamic>?;
                final message = args?['message'] ?? 'Mesaj yok';
                return HistoryDetailScreen(
                  message: message,
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  // Navigasyon metotları
  void goHome() {
    _router.go('/');
  }

  void goLogin() {
    _router.go('/login');
  }

  void goChatBot() {
    _router.go('/chatbot');
  }

  void goCategory() {
    _router.go('/category');
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

  void goHistoryDetail(HistoryModel message) {
    _router.go('/historydetail', extra: {
      'message': message,
    });
  }
}
