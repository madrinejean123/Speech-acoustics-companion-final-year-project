import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/route_names.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/screen_title.dart';

class _HistoryEntry {
  const _HistoryEntry({
    required this.time,
    required this.context,
    required this.before,
    required this.word,
    required this.after,
  });

  final String time;
  final String context;
  final String before;
  final String word;
  final String after;
}

const _entries = [
  _HistoryEntry(
    time: '09:38',
    context: 'MOBILE MONEY SHOP',
    before: "So I'm going to the ",
    word: 'bank',
    after: '.',
  ),
  _HistoryEntry(
    time: '09:22',
    context: 'PHONE CALL',
    before: "Tell him I'll come on ",
    word: 'Tuesday',
    after: '.',
  ),
  _HistoryEntry(
    time: '08:55',
    context: 'BODA STAGE',
    before: 'Take me to ',
    word: 'Wandegeya',
    after: ', please.',
  ),
  _HistoryEntry(
    time: '08:40',
    context: 'HOME',
    before: 'I need to buy ',
    word: 'paraffin',
    after: ' today.',
  ),
];

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

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
                  const ScreenTitle('Today'),
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Expanded(
                    child: _StatTile(value: '17', label: 'Helped'),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: _StatTile(value: '15', label: 'Right'),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: _StatTile(value: '232ms', label: 'Typical'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  itemCount: _entries.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 14),
                  itemBuilder: (context, index) =>
                      _HistoryRow(entry: _entries[index]),
                ),
              ),
              const SizedBox(height: 12),
              AppButton(
                label: 'Mark any that were wrong',
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

class _StatTile extends StatelessWidget {
  const _StatTile({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.wash,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(value, style: AppTextStyles.screenHeadline),
          const SizedBox(height: 2),
          Text(label, style: AppTextStyles.metaLabel),
        ],
      ),
    );
  }
}

class _HistoryRow extends StatelessWidget {
  const _HistoryRow({required this.entry});

  final _HistoryEntry entry;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.paper,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${entry.time} · ${entry.context}',
            style: AppTextStyles.metaLabel,
          ),
          const SizedBox(height: 6),
          Text.rich(
            TextSpan(
              style: AppTextStyles.body.copyWith(color: AppColors.ink),
              children: [
                TextSpan(text: entry.before),
                TextSpan(
                  text: entry.word,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    color: AppColors.spoken,
                    backgroundColor: AppColors.spokenWash,
                  ),
                ),
                TextSpan(text: entry.after),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
