import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:flutter/services.dart';
import 'package:one_goal/app/config/routes.dart';
import 'package:one_goal/app/config/theme.dart';
import 'package:provider/provider.dart';
import 'presentation/screen/auth/provider/auth_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:one_goal/presentation/providers/localizations_provider.dart';


void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
    ));
    usePathUrlStrategy();
    final localizationsProvider = LocalizationsProvider();
    await localizationsProvider.loadLocale();
    runApp(
		MultiProvider(
			providers: [
				ChangeNotifierProvider(create: (_) => Counter()),
        		ChangeNotifierProvider(create: (_) => AuthProvider()),
        		ChangeNotifierProvider(create: (_) => localizationsProvider),
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
        final localeProvider = Provider.of<LocalizationsProvider>(context);
        return MaterialApp.router(
            theme: ThemeData(
                primaryColor: Color(0xFF567CBD),
                scaffoldBackgroundColor: Color(0xFFF6F6F6),
                fontFamily: GoogleFonts.inter().fontFamily,
                textTheme: GoogleFonts.poppinsTextTheme().apply(
                    bodyColor: Color(0xFF313131),
                    displayColor: Color(0xFF313131),
                    decorationColor: Color(0xFF313131)
                ),
                appBarTheme: AppBarTheme(
                    backgroundColor: Colors.white,
                    titleTextStyle: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                    ),
                    centerTitle: true,
                ),
                snackBarTheme: SnackBarThemeData(
                    elevation: 6,
                    behavior: SnackBarBehavior.floating,
                    contentTextStyle: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white,
                    ),
                ),
            ),
            debugShowCheckedModeBanner: false,
            routerConfig: router,
			locale: localeProvider.locale,
			localizationsDelegates: AppLocalizations.localizationsDelegates,
  			supportedLocales: AppLocalizations.supportedLocales,
        );
    }
}