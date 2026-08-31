import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/route_names.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/screen_title.dart';

const _languages = ['Ugandan English', 'Luganda', 'Runyankole', 'Kiswahili'];

class WelcomeConsentScreen extends StatefulWidget {
  const WelcomeConsentScreen({super.key});

  @override
  State<WelcomeConsentScreen> createState() => _WelcomeConsentScreenState();
}

class _WelcomeConsentScreenState extends State<WelcomeConsentScreen> {
  String _selected = _languages.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ScreenTitle('Welcome'),
              const SizedBox(height: 20),
              const Text(
                'Which language do you speak most?',
                style: AppTextStyles.screenHeadline,
              ),
              const SizedBox(height: 10),
              const Text(
                'You can change this later, or switch mid-conversation.',
                style: AppTextStyles.body,
              ),
              const SizedBox(height: 24),
              for (final language in _languages) ...[
                _LanguageRow(
                  label: language,
                  selected: language == _selected,
                  onTap: () => setState(() => _selected = language),
                ),
                const SizedBox(height: 8),
              ],
              const Spacer(),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.wash,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Your speech stays on this phone. Nothing is uploaded, ever.',
                  style: AppTextStyles.body,
                ),
              ),
              const SizedBox(height: 12),
              AppButton(
                label: 'Continue',
                onPressed: () => context.go(Routes.voiceEnrolment),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LanguageRow extends StatelessWidget {
  const _LanguageRow({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? AppColors.selectedFill : AppColors.paper,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selected ? AppColors.ink : AppColors.line,
              width: selected ? 1.5 : 1,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.ink,
                  ),
                ),
              ),
              if (selected)
                const Icon(Icons.check, size: 18, color: AppColors.ink),
            ],
          ),
        ),
      ),
    );
  }
}
