import 'package:flutter/material.dart';
import 'package:giftbox/screens/chat_bot_screen.dart';
import 'package:giftbox/screens/home.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Home();
      },
      routes: <RouteBase>[
        GoRoute(
            path: 'chatbotscreen',
            builder: (BuildContext context, GoRouterState state) {
              return ChatBotScreen();
            }),
      ],
    ),
  ],
);
