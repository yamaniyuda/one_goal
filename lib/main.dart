import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:flutter/services.dart';
import 'package:one_goal/app/config/routes.dart';
import 'package:one_goal/app/config/theme.dart';
import 'package:provider/provider.dart';

void main() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
    ));
    usePathUrlStrategy();
    runApp(
		MultiProvider(
			providers: [
				// Add your providers here
			],
			child: const MyApp(),
		)
	);
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp.router(
            theme: themeData,
            debugShowCheckedModeBanner: false,
            routerConfig: router,
        );
    }
}