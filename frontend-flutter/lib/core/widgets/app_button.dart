import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

enum AppButtonVariant { primary, consent, ghost, onDark }

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    final Color background;
    final Color foreground;
    BoxBorder? border;

    switch (variant) {
      case AppButtonVariant.primary:
        background = AppColors.ink;
        foreground = AppColors.paper;
      case AppButtonVariant.consent:
        background = AppColors.stuck;
        foreground = AppColors.paper;
      case AppButtonVariant.ghost:
        background = Colors.transparent;
        foreground = AppColors.inkSoft;
        border = Border.all(color: AppColors.line);
      case AppButtonVariant.onDark:
        background = AppColors.paper.withValues(alpha: 0.13);
        foreground = AppColors.paper;
    }

    return SizedBox(
      width: double.infinity,
      child: Material(
        color: background,
        borderRadius: BorderRadius.circular(13),
        child: InkWell(
          borderRadius: BorderRadius.circular(13),
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              border: border,
            ),
            child: Text(
              label,
              style: AppTextStyles.buttonLabel.copyWith(color: foreground),
            ),
          ),
        ),
      ),
    );
  }
}
