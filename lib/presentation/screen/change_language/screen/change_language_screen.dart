import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_goal/presentation/providers/localizations_provider.dart';

class ChangeLanguageScreen extends StatefulWidget {
    const ChangeLanguageScreen({super.key});

    @override
    State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
    final List<Map<String, String>> languages = [
        {'name': 'English', 'flag': 'assets/flags/america.png', 'locale': 'en'},
        {'name': 'Bahasa Indonesia', 'flag': 'assets/flags/indonesia.png', 'locale': 'id'},
        {'name': '中文', 'flag': 'assets/flags/china.png', 'locale': 'zh'},
        {'name': '日本語', 'flag': 'assets/flags/jepan.png', 'locale': 'ja'},
    ];
    String? selectedLanguage;

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Change Language'),
            ),
            body: Column(
                children: [
                    Expanded(
                        child: SingleChildScrollView(
                            child: Column(
                                children: languages.map((language) {
                                    return GestureDetector(
                                        onTap: () {
                                            setState(() {
                                                selectedLanguage = language['name'];
                                            });
                                        },
                                        child: Container(
                                            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                            padding: const EdgeInsets.all(16),
                                            decoration: BoxDecoration(
                                                color: selectedLanguage == language['name'] ? Colors.blue[50] : Colors.white,
                                                border: Border.all(
                                                    color: selectedLanguage == language['name'] ? Colors.blue : Colors.grey,
                                                    width: 2,
                                                ),
                                                borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                    Row(
                                                        children: [
                                                            Image.asset(
                                                                language['flag']!,
                                                                width: 32,
                                                                height: 32,
                                                            ),
                                                            const SizedBox(width: 16),
                                                            Text(
                                                                language['name']!,
                                                                style: TextStyle(
                                                                    fontSize: 18,
                                                                    color: selectedLanguage == language['name'] ? Colors.blue : Colors.black,
                                                                ),
                                                            ),
                                                        ],
                                                    ),
                                                    if (selectedLanguage == language['name'])
                                                        const Icon(
                                                            Icons.check_circle,
                                                            color: Colors.blue,
                                                        ),
                                                ],
                                            ),
                                        ),
                                    );
                                }).toList(),
                            ),
                        ),
                    ),
                    Container(
                        padding: const EdgeInsets.all(16),
                        color: Colors.white,
                        child: ElevatedButton(
                            onPressed: selectedLanguage != null
                                ? () {
                                    final selectedLocale = languages.firstWhere((language) => language['name'] == selectedLanguage)['locale'];
                                    context.read<LocalizationsProvider>().setLocale(selectedLocale!);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('Language changed to: $selectedLanguage')),
                                    );
                                    context.pop();
                                }
                                : null,
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 50),
                                backgroundColor: selectedLanguage != null
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context).disabledColor,
                            ),
                            child: Text(
                                AppLocalizations.of(context)!.change_language,
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: selectedLanguage != null ? Colors.white : Colors.grey,
                                ),
                            ),
                        ),
                    ),
                ],
            ),
        );
    }
}