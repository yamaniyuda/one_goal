import 'package:go_router/go_router.dart';
import 'package:one_goal/presentation/screen/splash/spalsh.dart';
import 'package:one_goal/presentation/screen/main/main.dart';
import 'package:one_goal/presentation/screen/Auth/auth.dart';

final router = GoRouter(
    initialLocation: '/home',
    routes: [
        GoRoute(path: '/SignIn', builder: (context, state) => const InScreen()),
        GoRoute(path: '/SignUp', builder: (context, state) => const UpScreen()),
        ShellRoute(
            routes: [
                GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
                GoRoute(path: '/add-post', builder: (context, state) => AddPostScreen()),
                GoRoute(path: '/account', builder: (context, state) => AccountScreen()),
            ],
            builder: (context, state, child) {
                return MainScreen(child: child);
            },
        ),
        GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
    ],
);
