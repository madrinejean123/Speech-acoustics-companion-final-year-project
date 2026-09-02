import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/route_names.dart';

class ListeningScreen extends StatefulWidget {
  const ListeningScreen({super.key});

  @override
  State<ListeningScreen> createState() => _ListeningScreenState();
}

class _ListeningScreenState extends State<ListeningScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 0.92, end: 1.08).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
          'Listening',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
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
                // LISTENING STATUS
                // --------------------------------------------------
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 9,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F5EE),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.circle, size: 9, color: Color(0xFF22A06B)),
                      SizedBox(width: 8),
                      Text(
                        'Listening...',
                        style: TextStyle(
                          color: Color(0xFF18794E),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 45),

                // --------------------------------------------------
                // ANIMATED MICROPHONE
                // --------------------------------------------------
                AnimatedBuilder(
                  animation: _scaleAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Container(
                        width: 190,
                        height: 190,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFFE8EEFF),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF4F6EF7).withOpacity(0.15),
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
                            Icons.mic_rounded,
                            size: 75,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 35),

                // --------------------------------------------------
                // MAIN HEADING
                // --------------------------------------------------
                const Text(
                  'Speak naturally',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF172033),
                  ),
                ),

                const SizedBox(height: 10),

                // --------------------------------------------------
                // DESCRIPTION
                // --------------------------------------------------
                const Text(
                  'I’m listening to your speech and will help '
                  'when a speech block or disfluency is detected.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.5,
                    color: Color(0xFF697386),
                  ),
                ),

                const SizedBox(height: 30),

                // --------------------------------------------------
                // LIVE TRANSCRIPTION CARD
                // --------------------------------------------------
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: const Color(0xFFE4E8F0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 12,
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
                            size: 20,
                            color: Color(0xFF4F6EF7),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Live speech',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF172033),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 14),

                      Text(
                        'Your speech will appear here...',
                        style: TextStyle(
                          color: Color(0xFF9AA3B2),
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),

                // IMPORTANT:
                // Do NOT use Spacer() here because this Column
                // is inside a SingleChildScrollView.
                const SizedBox(height: 30),

                // --------------------------------------------------
                // SIMULATE BLOCK BUTTON
                // --------------------------------------------------
                TextButton.icon(
                  onPressed: () {
                    context.go(Routes.stuck);
                  },
                  icon: const Icon(Icons.warning_amber_rounded, size: 18),
                  label: const Text('Simulate block detected'),
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF697386),
                  ),
                ),

                const SizedBox(height: 10),

                // --------------------------------------------------
                // STOP LISTENING BUTTON
                // --------------------------------------------------
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      context.go(Routes.ready);
                    },
                    icon: const Icon(Icons.stop_rounded, color: Colors.white),
                    label: const Text(
                      'Stop Listening',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF172033),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
