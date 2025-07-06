import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:one_goal/app/config/const.dart';
import 'package:one_goal/presentation/screen/change_language/change_language.dart';
import 'package:one_goal/presentation/screen/post/post.dart';
import 'package:one_goal/presentation/screen/splash/screen/splash_screen.dart';
import 'package:one_goal/presentation/screen/splash/spalsh.dart';
import 'package:one_goal/presentation/screen/main/main.dart';
import 'package:one_goal/presentation/screen/onboarding/screen/onboarding_screen.dart';
import 'package:one_goal/presentation/screen/auth/auth.dart';
import 'package:one_goal/presentation/screen/notification/notification.dart';
import 'package:one_goal/presentation/screen/e_statement/e_statement.dart';
import 'package:shared_preferences/shared_preferences.dart';


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
            name: '/post/galang-dana', 
            builder: (context, state) => GalangDanaScreen(imageUrl: state.pathParameters['image'], title: state.pathParameters['title'])
        ),
        
        GoRoute(path: '/post/cerita-penggalangan', builder: (context, state) => CeritaPenggalanganScreen()),
        GoRoute(path: '/account/update-profile', builder: (context, state) => ProfileUpdateScreen()),
        GoRoute(path: '/notification', builder: (context, state) => NotificationScreen()),
        GoRoute(path: '/e-statement', builder: (context, state) => const StatementScreen()),
    ],
    redirect: (BuildContext context, GoRouterState state) async {
        final prefs = await SharedPreferences.getInstance();
        final isLoggedIn = prefs.getBool(LOGIN_PERSISTENCE_KEY) ?? false;
        
        if (isLoggedIn && state.matchedLocation != '/home') {
            return '/home';
        }

        if (!isLoggedIn && state.matchedLocation != '/SignIn' && state.matchedLocation != '/SignUp' && state.matchedLocation != '/splash' && state.matchedLocation != '/onboarding') {
            return '/SignIn';
        }

        return null;
    }
);
