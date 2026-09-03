import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_companion/core/router/route_names.dart';
import 'package:speech_companion/features/listening/screens/listening_screen.dart';

void main() {
  Widget buildApp() {
    final router = GoRouter(
      initialLocation: Routes.listening,
      routes: [
        GoRoute(
          path: Routes.listening,
          builder: (context, state) => const ListeningScreen(),
        ),
        GoRoute(
          path: Routes.stuck,
          builder: (context, state) => const Scaffold(body: Text('Stuck')),
        ),
        GoRoute(
          path: Routes.ready,
          builder: (context, state) => const Scaffold(body: Text('Ready')),
        ),
      ],
    );
    return MaterialApp.router(routerConfig: router);
  }

  testWidgets('shows the listening status and heading', (tester) async {
    await tester.pumpWidget(buildApp());
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('Listening...'), findsOneWidget);
    expect(find.text('Speak naturally'), findsOneWidget);

    await tester.pump(const Duration(seconds: 2));
  });

  testWidgets('tapping Simulate block detected navigates to Stuck', (
    tester,
  ) async {
    await tester.pumpWidget(buildApp());

    await tester.ensureVisible(find.text('Simulate block detected'));
    await tester.tap(find.text('Simulate block detected'));
    await tester.pumpAndSettle();

    expect(find.text('Stuck'), findsOneWidget);
  });

  testWidgets('tapping Stop Listening navigates to Ready', (tester) async {
    await tester.pumpWidget(buildApp());

    await tester.ensureVisible(find.text('Stop Listening'));
    await tester.tap(find.text('Stop Listening'));
    await tester.pumpAndSettle();

    expect(find.text('Ready'), findsOneWidget);
  });
}
