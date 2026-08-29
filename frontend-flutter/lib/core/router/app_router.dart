import 'package:go_router/go_router.dart';

import '../../features/control/screens/control_screen.dart';
import '../../features/history/screens/history_screen.dart';
import '../../features/home/screens/ready_screen.dart';
import '../../features/listening/screens/listening_screen.dart';
import '../../features/listening/screens/speaking_screen.dart';
import '../../features/listening/screens/stuck_screen.dart';
import '../../features/onboarding/screens/voice_enrolment_screen.dart';
import '../../features/onboarding/screens/welcome_consent_screen.dart';
import 'route_names.dart';

final appRouter = GoRouter(
  initialLocation: Routes.welcome,
  routes: [
    GoRoute(
      path: Routes.welcome,
      builder: (context, state) => const WelcomeConsentScreen(),
    ),
    GoRoute(
      path: Routes.voiceEnrolment,
      builder: (context, state) => const VoiceEnrolmentScreen(),
    ),
    GoRoute(
      path: Routes.ready,
      builder: (context, state) => const ReadyScreen(),
    ),
    GoRoute(
      path: Routes.listening,
      builder: (context, state) => const ListeningScreen(),
    ),
    GoRoute(
      path: Routes.stuck,
      builder: (context, state) => const StuckScreen(),
    ),
    GoRoute(
      path: Routes.speaking,
      builder: (context, state) => const SpeakingScreen(),
    ),
    GoRoute(
      path: Routes.history,
      builder: (context, state) => const HistoryScreen(),
    ),
    GoRoute(
      path: Routes.control,
      builder: (context, state) => const ControlScreen(),
    ),
  ],
);
