import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_companion/core/router/route_names.dart';
import 'package:speech_companion/features/history/screens/history_screen.dart';

void main() {
  Widget buildApp() {
    final router = GoRouter(
      initialLocation: Routes.history,
      routes: [
        GoRoute(
          path: Routes.history,
          builder: (context, state) => const HistoryScreen(),
        ),
        GoRoute(
          path: Routes.ready,
          builder: (context, state) => const Scaffold(body: Text('Ready')),
        ),
      ],
    );
    return MaterialApp.router(routerConfig: router);
  }

  testWidgets('shows stats and today\'s log entries', (tester) async {
    await tester.pumpWidget(buildApp());

    expect(find.text('17'), findsOneWidget);
    expect(find.text('Helped'), findsOneWidget);
    expect(find.text('15'), findsOneWidget);
    expect(find.text('232ms'), findsOneWidget);
    expect(find.textContaining('MOBILE MONEY SHOP'), findsOneWidget);
    expect(find.text('Mark any that were wrong'), findsOneWidget);
  });

  testWidgets('tapping back navigates to Ready', (tester) async {
    await tester.pumpWidget(buildApp());

    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    expect(find.text('Ready'), findsOneWidget);
  });
}
