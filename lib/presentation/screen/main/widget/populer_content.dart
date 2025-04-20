import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_goal/presentation/widget/card/card_bg_image.dart';

class PopulerContent extends StatefulWidget {
    const PopulerContent({super.key});

    @override
    State<PopulerContent> createState() => _PopulerContentState();
}

class _PopulerContentState extends State<PopulerContent> {
    final List<String> imagePaths = [
        'assets/image_3.png',
        'assets/image_4.png',
        'assets/image_2.png',
        'assets/image_1.png',
    ];

    @override
    Widget build(BuildContext context) {
        return Container(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                            'Populer 🔥',
                            style: GoogleFonts.inter(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                            ),
                        ),
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: [
                                const SizedBox(width: 20),
                                ...imagePaths.map((imagePath) => Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                            CardBgImage(
                                                image: AssetImage(imagePath),
                                                width: 250,
                                                height: 280,
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                                '2 Hari yang lalu',
                                                style: GoogleFonts.inter(
                                                    fontSize: 14,
                                                    color: Colors.grey
                                                ),
                                            ),
                                            Text(
                                                'Judul Kegiatan',
                                                style: GoogleFonts.inter(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                ),
                                            ),
                                        ],
                                    )
                                ))
                            ],
                        ),
                    )
                ],
            ),
        );
    }
}