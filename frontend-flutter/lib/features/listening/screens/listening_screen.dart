import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/route_names.dart';

class ListeningScreen extends StatelessWidget {
  const ListeningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Listening')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => context.go(Routes.stuck),
              child: const Text('Simulate block detected'),
            ),
            TextButton(
              onPressed: () => context.go(Routes.ready),
              child: const Text('Stop'),
            ),
          ],
        ),
      ),
    );
  }
}
