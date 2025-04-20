import 'package:flutter/material.dart';
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
                                'Temukan teman-teman disabilitas',
                                style: GoogleFonts.inter(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                ),
                            ),
                            Text(
                                'Bergabunglah dengan komunitas kami',
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
