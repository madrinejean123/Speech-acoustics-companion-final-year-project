import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/route_names.dart';

class SpeakingScreen extends StatelessWidget {
  const SpeakingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Speaking')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go(Routes.listening),
          child: const Text('Stop speaking'),
        ),
      ),
    );
  }
}
