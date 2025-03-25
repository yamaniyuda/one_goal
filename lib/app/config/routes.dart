import 'package:go_router/go_router.dart';
import 'package:one_goal/presentation/screen/splash/spalsh.dart';
import 'package:one_goal/presentation/screen/main/main.dart';
import 'package:one_goal/presentation/screen/Auth/auth.dart';

final router = GoRouter(
    routes: [
        GoRoute(path: '/', builder: (context, state) => const MainScreen()),
        GoRoute(path: '/SignIn', builder: (context, state) => const InScreen()),
        GoRoute(path: '/SignUp', builder: (context, state) => const UpScreen()),
        GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
    ],
);
