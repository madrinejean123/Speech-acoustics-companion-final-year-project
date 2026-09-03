import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_companion/core/router/route_names.dart';
import 'package:speech_companion/features/control/screens/control_screen.dart';

void main() {
  Widget buildApp() {
    final router = GoRouter(
      initialLocation: Routes.control,
      routes: [
        GoRoute(
          path: Routes.control,
          builder: (context, state) => const ControlScreen(),
        ),
        GoRoute(
          path: Routes.ready,
          builder: (context, state) => const Scaffold(body: Text('Ready')),
        ),
      ],
    );
    return MaterialApp.router(routerConfig: router);
  }

  testWidgets('shows the three help modes with Ask me first selected', (
    tester,
  ) async {
    await tester.pumpWidget(buildApp());

    expect(find.text('Ask me first'), findsOneWidget);
    expect(find.text("Speak when it's sure"), findsOneWidget);
    expect(find.text('Only when I ask'), findsOneWidget);
    expect(find.byIcon(Icons.radio_button_checked), findsOneWidget);
  });

  testWidgets('selecting a different mode moves the selection', (
    tester,
  ) async {
    await tester.pumpWidget(buildApp());

    await tester.tap(find.text('Only when I ask'));
    await tester.pump();

    final checkedFinder = find.ancestor(
      of: find.byIcon(Icons.radio_button_checked),
      matching: find.byType(Row),
    );
    expect(
      find.descendant(
        of: checkedFinder,
        matching: find.text('Only when I ask'),
      ),
      findsOneWidget,
    );
  });

  testWidgets('shows voice, offline and language settings', (tester) async {
    await tester.pumpWidget(buildApp());

    expect(find.text('Your voice'), findsOneWidget);
    expect(find.text('Works offline'), findsOneWidget);
    expect(find.text('Language'), findsOneWidget);
    expect(find.text('Delete my voice'), findsOneWidget);
  });

  testWidgets('tapping back navigates to Ready', (tester) async {
    await tester.pumpWidget(buildApp());

    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    expect(find.text('Ready'), findsOneWidget);
  });
}
