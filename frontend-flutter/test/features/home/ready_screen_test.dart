import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_companion/core/router/route_names.dart';
import 'package:speech_companion/features/home/screens/ready_screen.dart';

void main() {
  Widget buildApp() {
    final router = GoRouter(
      initialLocation: Routes.ready,
      routes: [
        GoRoute(
          path: Routes.ready,
          builder: (context, state) => const ReadyScreen(),
        ),
        GoRoute(
          path: Routes.listening,
          builder: (context, state) =>
              const Scaffold(body: Text('Listening')),
        ),
      ],
    );
    return MaterialApp.router(routerConfig: router);
  }

  testWidgets('shows the ready headline and status cards', (tester) async {
    await tester.pumpWidget(buildApp());

    expect(find.text('Ready when you are'), findsOneWidget);
    expect(find.text('Your voice'), findsOneWidget);
    expect(find.text('Ask first'), findsOneWidget);
    expect(find.text('Start listening'), findsOneWidget);
  });

  testWidgets('tapping Start listening navigates to the listening screen', (
    tester,
  ) async {
    await tester.pumpWidget(buildApp());

    await tester.tap(find.text('Start listening'));
    await tester.pumpAndSettle();

    expect(find.text('Listening'), findsOneWidget);
  });
}
