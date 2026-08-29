import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/route_names.dart';

class StuckScreen extends StatelessWidget {
  const StuckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stuck: key screen')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => context.go(Routes.speaking),
              child: const Text('Say it in my voice'),
            ),
            TextButton(
              onPressed: () => context.go(Routes.listening),
              child: const Text("No, I've got it"),
            ),
          ],
        ),
      ),
    );
  }
}
