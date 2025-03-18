import 'package:flutter/material.dart';
import 'package:one_goal/app/config/routes.dart';

void main() {
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp.router(
            routerConfig: router,
            debugShowCheckedModeBanner: false,
        );
    }
}
