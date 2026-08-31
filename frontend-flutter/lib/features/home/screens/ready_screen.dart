import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/route_names.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/screen_title.dart';

class ReadyScreen extends StatelessWidget {
  const ReadyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ScreenTitle('Speech companion'),
              const Spacer(),
              Center(
                child: Container(
                  width: 92,
                  height: 92,
                  decoration: const BoxDecoration(
                    color: AppColors.ink,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.mic,
                    color: AppColors.paper,
                    size: 36,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Ready when you are',
                textAlign: TextAlign.center,
                style: AppTextStyles.screenHeadline,
              ),
              const SizedBox(height: 10),
              const Text(
                'Tap to start. It will stay quiet unless you get stuck.',
                textAlign: TextAlign.center,
                style: AppTextStyles.body,
              ),
              const SizedBox(height: 24),
              const Row(
                children: [
                  Expanded(
                    child: _StatCard(title: 'Your voice', caption: 'Ready'),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: _StatCard(title: 'Ask first', caption: 'Help mode'),
                  ),
                ],
              ),
              const Spacer(),
              AppButton(
                label: 'Start listening',
                onPressed: () => context.go(Routes.listening),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.title, required this.caption});

  final String title;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.wash,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.settingTitle),
          const SizedBox(height: 2),
          Text(caption, style: AppTextStyles.metaLabel),
        ],
      ),
    );
  }
}
