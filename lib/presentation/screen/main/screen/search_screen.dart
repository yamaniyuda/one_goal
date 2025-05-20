import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchScreen extends StatefulWidget {
    const SearchScreen({super.key});

    @override
    State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
    @override
    Widget build(BuildContext context) {
        return Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Image.asset(
                        'assets/maintenance.png',
                        width: 300, 
                        height: 300,
                    ),
                    const SizedBox(height: 20),
                    Text(
                        AppLocalizations.of(context)!.under_maintenance,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                ],
            ),
        );
    }
}