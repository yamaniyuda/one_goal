import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardRectangle extends StatelessWidget {
    final String image;
    final String title;
    final double progress;
    final String description;
    final String amount;
    
    const CardRectangle({
        super.key,
        required this.image,
        required this.title,
        required this.progress,
        required this.description,
        required this.amount,
    });


    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Card(
                elevation: 0,
                color: Colors.transparent,
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
                                        description,
                                        style: GoogleFonts.inter(
                                            fontSize: 14,
                                            color: Colors.grey,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                        "Terkumpul Rp$amount",
                                        style: GoogleFonts.inter(
                                            fontSize: 14,
                                            color: Colors.grey,
                                        ),
                                    ),
                                    Stack(
                                        alignment: Alignment.center,
                                        children: [
                                            ClipRRect(
                                                borderRadius: BorderRadius.circular(100),
                                                child: SizedBox(
                                                    height: 14,
                                                    width: double.infinity,
                                                    child: LinearProgressIndicator(
                                                        value: progress / 100,
                                                        backgroundColor: Colors.grey,
                                                        valueColor: AlwaysStoppedAnimation<Color>(
                                                            Theme.of(context).primaryColor,
                                                        ),
                                                    ),
                                                ),
                                            ),
                                            Text(
                                                "${progress.toInt()}%",
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
            )
        );
    }
}