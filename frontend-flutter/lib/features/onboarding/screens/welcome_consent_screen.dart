import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/route_names.dart';

class WelcomeConsentScreen extends StatelessWidget {
  const WelcomeConsentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome & consent')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go(Routes.voiceEnrolment),
          child: const Text('Continue'),
        ),
      ),
    );
  }
}
