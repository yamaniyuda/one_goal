import 'package:go_router/go_router.dart';
import 'package:one_goal/presentation/screen/splash/spalsh.dart';
import 'package:one_goal/presentation/screen/main/main.dart';
import 'package:one_goal/presentation/screen/onboarding/screen/onboarding_screen.dart';

final router = GoRouter(
   initialLocation: '/splash',
    routes: [
        GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
        GoRoute(path: '/onboarding', builder: (context, state) => const OnboardingPage()),
        GoRoute(path: '/', builder: (context, state) => const MainScreen()),
    ],
);
