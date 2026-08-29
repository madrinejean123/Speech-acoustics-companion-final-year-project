import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/route_names.dart';

class VoiceEnrolmentScreen extends StatelessWidget {
  const VoiceEnrolmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Voice enrolment')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go(Routes.ready),
          child: const Text('Next sentence'),
        ),
      ),
    );
  }
}
