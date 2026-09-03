import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/route_names.dart';

class StuckScreen extends StatelessWidget {
  const StuckScreen({super.key});

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
          'Speech Support',
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
                const SizedBox(height: 35),

                // --------------------------------------------------
                // WARNING / SUPPORT ICON
                // --------------------------------------------------
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFFFF1E8),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFF28C28).withValues(alpha: 0.12),
                        blurRadius: 25,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(18),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFF28C28),
                    ),
                    child: const Icon(
                      Icons.record_voice_over_rounded,
                      size: 48,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // --------------------------------------------------
                // MAIN TITLE
                // --------------------------------------------------
                const Text(
                  'It sounds like you’re stuck',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF172033),
                  ),
                ),

                const SizedBox(height: 12),

                // --------------------------------------------------
                // DESCRIPTION
                // --------------------------------------------------
                const Text(
                  'That’s okay. Take a breath and choose what '
                  'feels most comfortable for you.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Color(0xFF697386),
                  ),
                ),

                const SizedBox(height: 35),

                // --------------------------------------------------
                // SUPPORT MESSAGE CARD
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
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 15,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.favorite_rounded,
                        color: Color(0xFF4F6EF7),
                        size: 25,
                      ),
                      SizedBox(width: 14),
                      Expanded(
                        child: Text(
                          'There’s no need to rush. You can let the '
                          'assistant help you express what you want to say.',
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.5,
                            color: Color(0xFF4A5568),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 35),

                // --------------------------------------------------
                // OPTION TITLE
                // --------------------------------------------------
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'What would you like to do?',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF172033),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // --------------------------------------------------
                // OPTION 1 - SAY IT IN MY VOICE
                // --------------------------------------------------
                SizedBox(
                  width: double.infinity,
                  height: 64,
                  child: ElevatedButton(
                    onPressed: () {
                      context.go(Routes.speaking);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4F6EF7),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.16),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.record_voice_over_rounded,
                            color: Colors.white,
                            size: 23,
                          ),
                        ),
                        const SizedBox(width: 14),
                        const Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Say it in my voice',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Let the assistant help express your words',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.arrow_forward_rounded, size: 22),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                // --------------------------------------------------
                // OPTION 2 - CONTINUE YOURSELF
                // --------------------------------------------------
                SizedBox(
                  width: double.infinity,
                  height: 64,
                  child: OutlinedButton(
                    onPressed: () {
                      context.go(Routes.listening);
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF172033),
                      backgroundColor: Colors.white,
                      side: const BorderSide(
                        color: Color(0xFFDDE2EA),
                        width: 1.2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF0F3F8),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.mic_rounded,
                            color: Color(0xFF4F6EF7),
                            size: 23,
                          ),
                        ),
                        const SizedBox(width: 14),
                        const Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "No, I've got it",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Continue speaking on your own',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF8A94A6),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_rounded,
                          size: 22,
                          color: Color(0xFF697386),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),

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
                      'Take your time. You’re in control.',
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
