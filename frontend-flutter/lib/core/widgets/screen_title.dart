import 'package:flutter/material.dart';

import '../theme/app_text_styles.dart';

class ScreenTitle extends StatelessWidget {
  const ScreenTitle(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(label.toUpperCase(), style: AppTextStyles.screenTitle);
  }
}
