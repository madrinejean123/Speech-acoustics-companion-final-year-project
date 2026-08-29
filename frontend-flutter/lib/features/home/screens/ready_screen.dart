import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/route_names.dart';

class ReadyScreen extends StatelessWidget {
  const ReadyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ready')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => context.go(Routes.listening),
              child: const Text('Start listening'),
            ),
            TextButton(
              onPressed: () => context.go(Routes.history),
              child: const Text('History'),
            ),
            TextButton(
              onPressed: () => context.go(Routes.control),
              child: const Text('Control'),
            ),
          ],
        ),
      ),
    );
  }
}
