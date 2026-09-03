import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_companion/core/router/route_names.dart';
import 'package:speech_companion/features/onboarding/screens/welcome_consent_screen.dart';

void main() {
  Widget buildApp() {
    final router = GoRouter(
      initialLocation: Routes.welcome,
      routes: [
        GoRoute(
          path: Routes.welcome,
          builder: (context, state) => const WelcomeConsentScreen(),
        ),
        GoRoute(
          path: Routes.voiceEnrolment,
          builder: (context, state) =>
              const Scaffold(body: Text('Voice enrolment')),
        ),
      ],
    );
    return MaterialApp.router(routerConfig: router);
  }

  testWidgets('shows all languages with English selected by default', (
    tester,
  ) async {
    await tester.pumpWidget(buildApp());

    expect(find.text('English'), findsOneWidget);
    expect(find.text('Luganda'), findsOneWidget);
    expect(find.text('Lusoga'), findsOneWidget);
    expect(find.text('Kiswahili'), findsOneWidget);
    expect(find.byIcon(Icons.check), findsOneWidget);
  });

  testWidgets('selecting a different language moves the checkmark', (
    tester,
  ) async {
    await tester.pumpWidget(buildApp());

    await tester.tap(find.text('Luganda'));
    await tester.pump();

    expect(find.byIcon(Icons.check), findsOneWidget);

    final checkFinder = find.ancestor(
      of: find.byIcon(Icons.check),
      matching: find.byType(Row),
    );
    expect(
      find.descendant(of: checkFinder, matching: find.text('Luganda')),
      findsOneWidget,
    );
  });

  testWidgets('tapping Continue navigates to voice enrolment', (
    tester,
  ) async {
    await tester.pumpWidget(buildApp());

    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    expect(find.text('Voice enrolment'), findsOneWidget);
  });
}
