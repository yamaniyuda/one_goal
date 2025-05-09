import 'package:go_router/go_router.dart';
import 'package:one_goal/presentation/screen/change_language/change_language.dart';
import 'package:one_goal/presentation/screen/post/post.dart';
import 'package:one_goal/presentation/screen/splash/screen/splash_screen.dart';
import 'package:one_goal/presentation/screen/splash/spalsh.dart';
import 'package:one_goal/presentation/screen/main/main.dart';
import 'package:one_goal/presentation/screen/onboarding/screen/onboarding_screen.dart';
import 'package:one_goal/presentation/screen/auth/auth.dart';


final router = GoRouter(
    initialLocation: '/splash', // Halaman pertama yang akan muncul
    routes: [
        
        GoRoute(path: '/SignIn', builder: (context, state) => const InScreen()),
        GoRoute(path: '/SignUp', builder: (context, state) => const UpScreen()),
        
        ShellRoute(
            routes: [
                GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
                GoRoute(path: '/add-post', builder: (context, state) => AddPostScreen()),
                GoRoute(path: '/account', builder: (context, state) => const ProfileScreen()),
            ],
            builder: (context, state, child) {
                return MainScreen(child:child); 
            },
        ),
        
        GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
        GoRoute(path: '/onboarding', builder: (context, state) => const OnboardingPage()),
        GoRoute(path: '/change-language', builder: (context, state) => const ChangeLanguageScreen()),
        GoRoute(path: '/post/short-video', builder: (context, state) => ShortVideoScreen()),
        
        GoRoute(
            path: '/post/galang-dana/:title/:image',
            name: 'post/galang-dana', 
            builder: (context, state) => GalangDanaScreen(imageUrl: state.pathParameters['image'], title: state.pathParameters['title'])
        ),
        
        GoRoute(path: '/post/cerita-penggalangan', builder: (context, state) => CeritaPenggalanganScreen()),
    ],
);
