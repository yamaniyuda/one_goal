import 'package:go_router/go_router.dart';
import 'package:one_goal/presentation/screen/splash/screen/splash_screen.dart';
import 'package:one_goal/presentation/screen/splash/spalsh.dart';
import 'package:one_goal/presentation/screen/main/main.dart';
import 'package:one_goal/presentation/screen/onboarding/screen/onboarding_screen.dart';
import 'package:one_goal/presentation/screen/Auth/auth.dart';


final router = GoRouter(
  initialLocation: '/splash', // Halaman pertama yang akan muncul
  routes: [
    // Rute untuk login dan signup
    GoRoute(path: '/SignIn', builder: (context, state) => const InScreen()),
    GoRoute(path: '/SignUp', builder: (context, state) => const UpScreen()),
    
    // ShellRoute untuk routing ke halaman utama dan akun
    ShellRoute(
      routes: [
        GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
        GoRoute(path: '/add-post', builder: (context, state) => AddPostScreen()),
        GoRoute(path: '/account', builder: (context, state) => const ProfileScreen()), // Rute untuk Profile Screen
      ],
      builder: (context, state, child) {
        return MainScreen(child:child);  // Membungkus semua halaman di MainScreen
      },
    ),
    
    // Rute lainnya
    GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/onboarding', builder: (context, state) => const OnboardingPage()),
  ],
);
