import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_companion/core/router/route_names.dart';
import 'package:speech_companion/features/onboarding/screens/voice_enrolment_screen.dart';

void main() {
  Widget buildApp() {
    final router = GoRouter(
      initialLocation: Routes.voiceEnrolment,
      routes: [
        GoRoute(
          path: Routes.voiceEnrolment,
          builder: (context, state) => const VoiceEnrolmentScreen(),
        ),
        GoRoute(
          path: Routes.ready,
          builder: (context, state) => const Scaffold(body: Text('Ready')),
        ),
      ],
    );
    return MaterialApp.router(routerConfig: router);
  }

  testWidgets('shows the first sentence and progress counter', (
    tester,
  ) async {
    await tester.pumpWidget(buildApp());

    expect(
      find.text(
        'The morning bus to town leaves before the market opens.',
      ),
      findsOneWidget,
    );
    expect(find.text('1 of 12 sentences'), findsOneWidget);
  });

  testWidgets('tapping Next sentence advances to the next sentence', (
    tester,
  ) async {
    await tester.pumpWidget(buildApp());

    await tester.tap(find.text('Next sentence'));
    await tester.pump();

    expect(
      find.text(
        'She kept the receipt in case the shop asked for it back.',
      ),
      findsOneWidget,
    );
    expect(find.text('2 of 12 sentences'), findsOneWidget);
  });

  testWidgets('finishing the last sentence navigates to Ready', (
    tester,
  ) async {
    await tester.pumpWidget(buildApp());

    for (var i = 0; i < 11; i++) {
      await tester.tap(find.text('Next sentence'));
      await tester.pump();
    }
    expect(find.text('12 of 12 sentences'), findsOneWidget);

    await tester.tap(find.text('Next sentence'));
    await tester.pumpAndSettle();

    expect(find.text('Ready'), findsOneWidget);
  });
}
