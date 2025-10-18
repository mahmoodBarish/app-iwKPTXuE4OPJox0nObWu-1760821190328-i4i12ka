import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/messanger_chats.dart';
import 'screens/messanger_swipe_actions.dart';
import 'screens/messanger_people.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/messanger_chats',
  routes: [
    GoRoute(
      path: '/messanger_chats',
      builder: (context, state) => const MessangerChats(),
    ),
    GoRoute(
      path: '/messanger_swipe_actions',
      builder: (context, state) => const MessangerSwipeActions(),
    ),
    GoRoute(
      path: '/messanger_people',
      builder: (context, state) => const MessangerPeople(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerConfig: _router,
    );
  }
}