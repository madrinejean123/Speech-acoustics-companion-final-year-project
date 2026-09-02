import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/route_names.dart';

class SpeakingScreen extends StatelessWidget {
  const SpeakingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),

      // ------------------------------------------------------------
      // APP BAR
      // ------------------------------------------------------------
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: const Color(0xFF172033),
        centerTitle: true,
        title: const Text(
          'Speaking',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),

      // ------------------------------------------------------------
      // BODY
      // ------------------------------------------------------------
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 30),

                // --------------------------------------------------
                // STATUS
                // --------------------------------------------------
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 9,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8EEFF),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.circle, size: 9, color: Color(0xFF4F6EF7)),
                      SizedBox(width: 8),
                      Text(
                        'Speaking for you',
                        style: TextStyle(
                          color: Color(0xFF3655C7),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 45),

                // --------------------------------------------------
                // VOICE ICON
                // --------------------------------------------------
                Container(
                  width: 190,
                  height: 190,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFE8EEFF),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF4F6EF7).withValues(alpha: 0.15),
                        blurRadius: 35,
                        spreadRadius: 12,
                      ),
                    ],
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(25),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF4F6EF7),
                    ),
                    child: const Icon(
                      Icons.record_voice_over_rounded,
                      size: 70,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 35),

                // --------------------------------------------------
                // MAIN TITLE
                // --------------------------------------------------
                const Text(
                  'Let me say it for you',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF172033),
                  ),
                ),

                const SizedBox(height: 12),

                // --------------------------------------------------
                // DESCRIPTION
                // --------------------------------------------------
                const Text(
                  'I’ll use your saved voice to help express '
                  'what you want to say. Take your time and '
                  'focus on your message.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.5,
                    color: Color(0xFF697386),
                  ),
                ),

                const SizedBox(height: 30),

                // --------------------------------------------------
                // MESSAGE CARD
                // --------------------------------------------------
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFE4E8F0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: .04),
                        blurRadius: 14,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.graphic_eq_rounded,
                            color: Color(0xFF4F6EF7),
                            size: 21,
                          ),
                          SizedBox(width: 9),
                          Text(
                            'Voice output',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF172033),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 15),

                      Text(
                        'Your message will be spoken in your voice...',
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.4,
                          color: Color(0xFF9AA3B2),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // --------------------------------------------------
                // VOICE ACTIVE INDICATOR
                // --------------------------------------------------
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F3F8),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.volume_up_rounded,
                        size: 20,
                        color: Color(0xFF4F6EF7),
                      ),
                      SizedBox(width: 9),
                      Text(
                        'Voice assistance is active',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF4A5568),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 35),

                // --------------------------------------------------
                // STOP SPEAKING BUTTON
                // --------------------------------------------------
                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      context.go(Routes.listening);
                    },
                    icon: const Icon(Icons.stop_rounded, color: Colors.white),
                    label: const Text(
                      'Stop speaking',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF172033),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                // --------------------------------------------------
                // RETURN TO LISTENING
                // --------------------------------------------------
                TextButton.icon(
                  onPressed: () {
                    context.go(Routes.listening);
                  },
                  icon: const Icon(Icons.arrow_back_rounded, size: 18),
                  label: const Text('Return to listening'),
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF697386),
                  ),
                ),

                const SizedBox(height: 25),

                // --------------------------------------------------
                // REASSURANCE
                // --------------------------------------------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.check_circle_outline_rounded,
                      size: 18,
                      color: Color(0xFF22A06B),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'You’re in control. Take your time.',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
