import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardRectangle extends StatelessWidget {
    final String image;
    final String title;

    
    const CardRectangle({
        super.key,
        required this.image,
        required this.title,
    });


    @override
    Widget build(BuildContext context) {
        return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                            image,
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                        ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Text(
                                    title,
                                    style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                    ),
                                ),
                                Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                    style: GoogleFonts.inter(
                                        fontSize: 14,
                                        color: Colors.grey,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                    'Terkumpul Rp 1.000.000',
                                    style: GoogleFonts.inter(
                                        fontSize: 14,
                                        color: Colors.grey,
                                    ),
                                ),
                                Stack(
                                    alignment: Alignment.center,
                                    children: [
                                        SizedBox(
                                            height: 14,
                                            child: LinearProgressIndicator(
                                                value: 0.5,
                                                backgroundColor: Colors.grey,
                                                valueColor: AlwaysStoppedAnimation<Color>(
                                                    Theme.of(context).primaryColor,
                                                ),
                                            ),
                                        ),
                                        Text(
                                            '50%',
                                            style: GoogleFonts.inter(
                                                fontSize: 8,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                            ),
                                        ),
                                    ],
                                ),
                            ],
                        ),
                    )
                ],
            ),
        );
    }
}