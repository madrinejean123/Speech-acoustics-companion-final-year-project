import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_companion/core/router/route_names.dart';
import 'package:speech_companion/features/listening/screens/stuck_screen.dart';

void main() {
  Widget buildApp() {
    final router = GoRouter(
      initialLocation: Routes.stuck,
      routes: [
        GoRoute(
          path: Routes.stuck,
          builder: (context, state) => const StuckScreen(),
        ),
        GoRoute(
          path: Routes.speaking,
          builder: (context, state) => const Scaffold(body: Text('Speaking')),
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

  testWidgets('shows the stuck heading and both options', (tester) async {
    await tester.pumpWidget(buildApp());

    expect(find.text('It sounds like you’re stuck'), findsOneWidget);
    expect(find.text('Say it in my voice'), findsOneWidget);
    expect(find.text("No, I've got it"), findsOneWidget);
  });

  testWidgets('tapping Say it in my voice navigates to Speaking', (
    tester,
  ) async {
    await tester.pumpWidget(buildApp());

    await tester.ensureVisible(find.text('Say it in my voice'));
    await tester.tap(find.text('Say it in my voice'));
    await tester.pumpAndSettle();

    expect(find.text('Speaking'), findsOneWidget);
  });

  testWidgets("tapping No, I've got it navigates to Listening", (
    tester,
  ) async {
    await tester.pumpWidget(buildApp());

    await tester.ensureVisible(find.text("No, I've got it"));
    await tester.tap(find.text("No, I've got it"));
    await tester.pumpAndSettle();

    expect(find.text('Listening'), findsOneWidget);
  });
}
