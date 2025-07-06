import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_goal/presentation/widget/card/card_bg_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:one_goal/presentation/screen/post/screen/galang_dana_screen.dart';

class PopulerContent extends StatefulWidget {
    const PopulerContent({super.key});

    @override
    State<PopulerContent> createState() => _PopulerContentState();
}

class _PopulerContentState extends State<PopulerContent> {
    final PageController _pageController = PageController(viewportFraction: 1);
    int _currentIndex = 0;

    @override
    Widget build(BuildContext context) {
        final List<Map<String, dynamic>> popularItems = [
            {
                'imagePath': 'assets/1.jpg',
                'percentage': 0.5,
                'time': "2 ${AppLocalizations.of(context)!.days_ago}",
                'title': 'Bantu Pembangunan Sekolah',
            },
            {
                'imagePath': 'assets/2.jpg',
                'percentage': 0.7,
                'time': "2 ${AppLocalizations.of(context)!.days_ago}",
                'title': 'Donasi untuk Korban Bencana',
            },
            {
                'imagePath': 'assets/3.jpg',
                'percentage': 0.25,
                'time': "2 ${AppLocalizations.of(context)!.days_ago}",
                'title': 'Sahur dan Buka untuk Dhuafa',
            },
            {
                'imagePath': 'assets/4.jpg',
                'percentage': 0.9,
                'time': "2 ${AppLocalizations.of(context)!.days_ago}",
                'title': 'Dukung UMKM Lokal Bangkit',
            },
            {
                'imagePath': 'assets/pendidikan.jpg',
                'percentage': 0.6,
                'time': "1 ${AppLocalizations.of(context)!.days_ago}",
                'title': 'Beasiswa Anak Yatim',
            },
            {
                'imagePath': 'assets/pendidikan.jpg',
                'percentage': 0.4,
                'time': "3 ${AppLocalizations.of(context)!.days_ago}",
                'title': 'Pengadaan Air Bersih di Desa',
            },
        ];

        final double screenWidth = MediaQuery.of(context).size.width;

        return Container(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                            "${AppLocalizations.of(context)!.populer} 🔥",
                            style: GoogleFonts.inter(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                            ),
                        ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                        height: 320,
                        child: PageView.builder(
                            controller: _pageController,
                            itemCount: popularItems.length,
                            onPageChanged: (index) {
                                setState(() {
                                    _currentIndex = index;
                                });
                            },
                            itemBuilder: (context, index) {
                                final item = popularItems[index];
                                return GestureDetector(
                                    
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => GalangDanaScreen(
                                            imageUrl: item['imagePath'],
                                            title: item['title'],
                                          ),
                                        ),
                                      );
                                    },
                                    
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 16),
                                        child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                                CardBgImage(
                                                    image: AssetImage(item['imagePath']),
                                                    width: screenWidth - 32,
                                                    height: 260,
                                                    progress: item['percentage'],
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                    item['time'],
                                                    style: GoogleFonts.inter(
                                                        fontSize: 14,
                                                        color: Colors.grey,
                                                    ),
                                                ),
                                                Text(
                                                    item['title'],
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: GoogleFonts.inter(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold,
                                                    ),
                                                ),
                                            ],
                                        ),
                                    ),
                                );
                            },
                        ),
                    ),
                    
                ],
            ),
        );
    }
}
