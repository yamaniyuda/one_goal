import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:flutter/services.dart';
import 'package:one_goal/app/config/routes.dart';
import 'package:one_goal/app/config/theme.dart';
import 'package:provider/provider.dart';
import 'presentation/screen/Auth/screen/auth_provider.dart';


void main() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
    ));
    usePathUrlStrategy();
    runApp(
		MultiProvider(
			providers: [
				ChangeNotifierProvider(create: (_) => Counter()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
			],
			child: const MyApp(),
		)
	);
}


class Counter with ChangeNotifier, DiagnosticableTreeMixin {
	int _count = 0;

	int get count => _count;

	void increment() {
		_count++;
		notifyListeners();
	}

	/// Makes `Counter` readable inside the devtools by listing all of its properties
	@override
	void debugFillProperties(DiagnosticPropertiesBuilder properties) {
		super.debugFillProperties(properties);
		properties.add(IntProperty('count', count));
	}
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