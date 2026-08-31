import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/route_names.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/screen_title.dart';
import '../../../core/widgets/waveform.dart';

const _sentences = [
  'The morning bus to town leaves before the market opens.',
  'She kept the receipt in case the shop asked for it back.',
  'Rain came early, so the boda riders parked under the roof.',
  'He counted the change twice before handing over the bag.',
  'The power went off just as the kettle began to whistle.',
  'They planted maize on the far side of the compound.',
  'Every Sunday the choir practices after the second service.',
  'The teacher asked us to read the next chapter at home.',
  'A new stall opened near the taxi park last week.',
  'The phone battery died before she could send the message.',
  'Neighbours gathered to watch the match on the small television.',
  'The mechanic said the car would be ready by evening.',
];

class VoiceEnrolmentScreen extends StatefulWidget {
  const VoiceEnrolmentScreen({super.key});

  @override
  State<VoiceEnrolmentScreen> createState() => _VoiceEnrolmentScreenState();
}

class _VoiceEnrolmentScreenState extends State<VoiceEnrolmentScreen> {
  int _index = 0;

  void _next() {
    if (_index == _sentences.length - 1) {
      context.go(Routes.ready);
      return;
    }
    setState(() => _index += 1);
  }

  @override
  Widget build(BuildContext context) {
    final current = _index + 1;
    final remaining = _sentences.length - _index;
    final minutesLeft = (remaining * 15 / 60).ceil().clamp(1, 99);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ScreenTitle('Setup · Step 2 of 3'),
              const SizedBox(height: 20),
              const Text(
                'Read this out, in your own time.',
                style: AppTextStyles.screenHeadline,
              ),
              const SizedBox(height: 10),
              const Text(
                'No rush, and stammering is fine. The app is learning how '
                'your voice sounds, not what you say.',
                style: AppTextStyles.body,
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.wash,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  _sentences[_index],
                  style: AppTextStyles.transcript,
                ),
              ),
              const SizedBox(height: 20),
              const Waveform(animate: true),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$current of ${_sentences.length} sentences',
                    style: AppTextStyles.metaLabel,
                  ),
                  Text(
                    'about $minutesLeft min left',
                    style: AppTextStyles.metaLabel,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: LinearProgressIndicator(
                  value: current / _sentences.length,
                  minHeight: 4,
                  backgroundColor: AppColors.wash,
                  valueColor: const AlwaysStoppedAnimation(AppColors.ink),
                ),
              ),
              const Spacer(),
              AppButton(label: 'Next sentence', onPressed: _next),
            ],
          ),
        ),
      ),
    );
  }
}
