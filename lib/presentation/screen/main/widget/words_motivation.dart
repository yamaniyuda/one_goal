import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class WordsMotivation extends StatelessWidget {
    const WordsMotivation({super.key});

    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
                children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text(
                                AppLocalizations.of(context)!.find_friends_with_disabilities,
                                style: GoogleFonts.inter(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                ),
                            ),
                            Text(
                                AppLocalizations.of(context)!.join_our_community,
                                style: GoogleFonts.inter(
                                    fontSize: 14,
                                    color: Colors.white,
                                ),
                            ),
                        ],
                    ),
                    SizedBox(width: 10),
                ],
            ),
        );
    }
}
