import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_companion/core/router/route_names.dart';
import 'package:speech_companion/features/listening/screens/speaking_screen.dart';

void main() {
  Widget buildApp() {
    final router = GoRouter(
      initialLocation: Routes.speaking,
      routes: [
        GoRoute(
          path: Routes.speaking,
          builder: (context, state) => const SpeakingScreen(),
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

  testWidgets('shows the speaking status and heading', (tester) async {
    await tester.pumpWidget(buildApp());

    expect(find.text('Speaking for you'), findsOneWidget);
    expect(find.text('Let me say it for you'), findsOneWidget);
  });

  testWidgets('tapping Stop speaking navigates to Listening', (tester) async {
    await tester.pumpWidget(buildApp());

    await tester.ensureVisible(find.text('Stop speaking'));
    await tester.tap(find.text('Stop speaking'));
    await tester.pumpAndSettle();

    expect(find.text('Listening'), findsOneWidget);
  });

  testWidgets('tapping Return to listening navigates to Listening', (
    tester,
  ) async {
    await tester.pumpWidget(buildApp());

    await tester.ensureVisible(find.text('Return to listening'));
    await tester.tap(find.text('Return to listening'));
    await tester.pumpAndSettle();

    expect(find.text('Listening'), findsOneWidget);
  });
}
