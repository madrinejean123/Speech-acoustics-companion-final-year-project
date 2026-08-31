import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

enum WaveformMode { normal, stuck, spoken }

class Waveform extends StatefulWidget {
  const Waveform({
    super.key,
    this.mode = WaveformMode.normal,
    this.onDark = false,
    this.playedFraction = 0,
    this.animate = false,
  });

  final WaveformMode mode;
  final bool onDark;
  final double playedFraction;
  final bool animate;

  @override
  State<Waveform> createState() => _WaveformState();
}

class _WaveformState extends State<Waveform>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    );
    if (widget.animate) _controller.repeat();
  }

  @override
  void didUpdateWidget(covariant Waveform oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animate && !_controller.isAnimating) {
      _controller.repeat();
    } else if (!widget.animate && _controller.isAnimating) {
      _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 66,
      width: double.infinity,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return CustomPaint(
            painter: _WaveformPainter(
              phase: _controller.value,
              mode: widget.mode,
              onDark: widget.onDark,
              playedFraction: widget.playedFraction,
            ),
          );
        },
      ),
    );
  }
}

class _WaveformPainter extends CustomPainter {
  _WaveformPainter({
    required this.phase,
    required this.mode,
    required this.onDark,
    required this.playedFraction,
  });

  final double phase;
  final WaveformMode mode;
  final bool onDark;
  final double playedFraction;

  static const _barWidth = 3.0;
  static const _gap = 10.0;
  static const _minHeight = 8.0;
  static const _maxHeight = 50.0;
  static const _stuckHeight = 4.0;

  double _levelAt(int i) {
    final wave = math.sin(i * 0.7) + math.sin(i * 1.9 + 1.3) * 0.5;
    return ((wave + 1.5) / 3).clamp(0.15, 1.0);
  }

  @override
  void paint(Canvas canvas, Size size) {
    const pitch = _barWidth + _gap;
    final count = (size.width / pitch).floor();
    final paint = Paint()..style = PaintingStyle.fill;
    final centerY = size.height / 2;

    for (var i = 0; i < count; i++) {
      var level = _levelAt(i);
      if (mode == WaveformMode.normal) {
        level = (level + math.sin(phase * 2 * math.pi + i) * 0.08).clamp(
          0.15,
          1.0,
        );
      }

      final height = mode == WaveformMode.stuck
          ? _stuckHeight
          : _minHeight + level * (_maxHeight - _minHeight);

      paint.color = _colorFor(i, count);

      final rect = RRect.fromLTRBR(
        i * pitch,
        centerY - height / 2,
        i * pitch + _barWidth,
        centerY + height / 2,
        const Radius.circular(1.5),
      );
      canvas.drawRRect(rect, paint);
    }
  }

  Color _colorFor(int index, int count) {
    final faint = onDark
        ? AppColors.paper.withValues(alpha: 0.32)
        : AppColors.inkFaint;

    switch (mode) {
      case WaveformMode.stuck:
        return AppColors.stuck.withValues(alpha: 0.34);
      case WaveformMode.spoken:
        final playedCount = (count * playedFraction).round();
        return index < playedCount ? AppColors.spoken : faint;
      case WaveformMode.normal:
        final texture = onDark
            ? AppColors.paper.withValues(alpha: 0.6)
            : AppColors.ink;
        return index % 3 == 0 ? texture : faint;
    }
  }

  @override
  bool shouldRepaint(covariant _WaveformPainter oldDelegate) {
    return oldDelegate.phase != phase ||
        oldDelegate.mode != mode ||
        oldDelegate.onDark != onDark ||
        oldDelegate.playedFraction != playedFraction;
  }
}
