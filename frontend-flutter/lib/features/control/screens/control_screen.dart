import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/route_names.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/screen_title.dart';

enum HelpMode { askFirst, speakWhenSure, onlyWhenAsked }

const _modeDescriptions = {
  HelpMode.askFirst: (
    title: 'Ask me first',
    caption: 'Shows guesses. Speaks only when you tap. Safest.',
  ),
  HelpMode.speakWhenSure: (
    title: "Speak when it's sure",
    caption: 'Speaks on its own above 90% confidence. Faster, riskier.',
  ),
  HelpMode.onlyWhenAsked: (
    title: 'Only when I ask',
    caption: 'Silent until you press the button on your earpiece.',
  ),
};

class ControlScreen extends StatefulWidget {
  const ControlScreen({super.key});

  @override
  State<ControlScreen> createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  HelpMode _mode = HelpMode.askFirst;
  bool _offlineOnly = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.ink,
                      size: 20,
                    ),
                    onPressed: () => context.go(Routes.ready),
                  ),
                  const SizedBox(width: 12),
                  const ScreenTitle('How it helps you'),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    for (final mode in HelpMode.values) ...[
                      _ModeRow(
                        title: _modeDescriptions[mode]!.title,
                        caption: _modeDescriptions[mode]!.caption,
                        selected: mode == _mode,
                        onTap: () => setState(() => _mode = mode),
                      ),
                      const SizedBox(height: 8),
                    ],
                    const SizedBox(height: 16),
                    _SettingRow(
                      title: 'Your voice',
                      caption: 'Recorded 12 Aug',
                      action: 'Re-record',
                      onTap: () {},
                    ),
                    const Divider(height: 24, color: AppColors.line),
                    _SettingRow(
                      title: 'Works offline',
                      caption: 'Nothing leaves this phone',
                      trailing: Switch(
                        value: _offlineOnly,
                        activeTrackColor: AppColors.ink,
                        onChanged: (value) =>
                            setState(() => _offlineOnly = value),
                      ),
                    ),
                    const Divider(height: 24, color: AppColors.line),
                    _SettingRow(
                      title: 'Language',
                      caption: 'Ugandan English',
                      action: 'Change',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              AppButton(
                label: 'Delete my voice',
                variant: AppButtonVariant.ghost,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ModeRow extends StatelessWidget {
  const _ModeRow({
    required this.title,
    required this.caption,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final String caption;
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                selected ? Icons.radio_button_checked : Icons.radio_button_off,
                size: 18,
                color: selected ? AppColors.ink : AppColors.inkFaint,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTextStyles.settingTitle),
                    const SizedBox(height: 2),
                    Text(caption, style: AppTextStyles.settingDescription),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SettingRow extends StatelessWidget {
  const _SettingRow({
    required this.title,
    required this.caption,
    this.action,
    this.trailing,
    this.onTap,
  });

  final String title;
  final String caption;
  final String? action;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.settingTitle),
              const SizedBox(height: 2),
              Text(caption, style: AppTextStyles.settingDescription),
            ],
          ),
        ),
        trailing ?? const SizedBox.shrink(),
        if (action != null)
          TextButton(
            onPressed: onTap,
            child: Text(
              action!,
              style: AppTextStyles.settingTitle.copyWith(
                color: AppColors.inkSoft,
              ),
            ),
          ),
      ],
    );
  }
}
