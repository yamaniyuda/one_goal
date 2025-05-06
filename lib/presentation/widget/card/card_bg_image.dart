import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardBgImage extends StatefulWidget {
    final ImageProvider image;
    final double width;
    final double height;

    const CardBgImage({super.key, required this.image, required this.width, required this.height});

    @override
    State<CardBgImage> createState() => _CardBgImageState();
}

class _CardBgImageState extends State<CardBgImage> {
    @override
    Widget build(BuildContext context) {
        return SizedBox(
            height: widget.height,
            width: widget.width,
            child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: widget.image,
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withValues(alpha: .5), 
                            BlendMode.darken,
                        ),
                    ),
                    borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(
                            '50%',
                            style: GoogleFonts.inter(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                            ),
                        ),
                        Text(
                            'Pengumpulan Dana',
                            style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                            ),
                        ),
                        const SizedBox(height: 5),
                        LinearProgressIndicator(
                            value: 0.5,
                            backgroundColor: Colors.white.withValues(alpha: .3),
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                            ),
                        ),

                    ],
                ),
            ),
        );
    }
}