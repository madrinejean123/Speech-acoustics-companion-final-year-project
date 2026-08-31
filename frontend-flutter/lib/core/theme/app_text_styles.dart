import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const screenHeadline = TextStyle(
    fontFamily: 'Newsreader',
    fontSize: 25,
    fontWeight: FontWeight.w400,
    height: 1.24,
    letterSpacing: -0.4,
    color: AppColors.ink,
  );

  static const transcript = TextStyle(
    fontFamily: 'Newsreader',
    fontSize: 20,
    fontWeight: FontWeight.w400,
    height: 1.45,
    color: AppColors.ink,
  );

  static const body = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13,
    height: 1.55,
    color: AppColors.inkSoft,
  );

  static const screenTitle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 11,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.4,
    color: AppColors.inkFaint,
  );

  static const buttonLabel = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const statusPill = TextStyle(
    fontFamily: 'Inter',
    fontSize: 10.5,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.05,
  );

  static const candidateWord = TextStyle(
    fontFamily: 'Newsreader',
    fontSize: 21,
    fontWeight: FontWeight.w400,
  );

  static const settingTitle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.ink,
  );

  static const settingDescription = TextStyle(
    fontFamily: 'Inter',
    fontSize: 11.5,
    height: 1.45,
    color: AppColors.inkSoft,
  );

  static const metaLabel = TextStyle(
    fontFamily: 'Inter',
    fontSize: 10.5,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.6,
    color: AppColors.inkFaint,
  );
}
