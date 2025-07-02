import 'package:flutter/material.dart';
import 'package:one_goal/presentation/widget/card/card_rectangle.dart';

class PostContent extends StatelessWidget {
    PostContent({super.key});

    final List<Map<String, dynamic>> donations = [
      {
        'title': 'Bantuan Banjir Jakarta',
        'description': 'Bantu saudara kita yang terdampak banjir di Jakarta Selatan.',
        'imageUrl': 'assets/post_3.png',
        'amount': 'Rp 1.000.000',
        'progress': 30,
      },
      {
        'title': 'Peduli Pendidikan',
        'description': 'Dukung anak-anak kurang mampu agar bisa sekolah.',
        'imageUrl': 'assets/pendidikan.jpg',
        'amount': 'Rp 850.000',
        'progress': 40,
      },
      {
        'title': 'Bantu UMKM Bangkit',
        'description': 'Bantu pelaku usaha kecil menengah untuk pulih pasca pandemi.',
        'imageUrl': 'assets/post_4.png',
        'amount': 'Rp 1.200.000',
        'progress': 100,
      },
      {
        'title': 'Makanan untuk Dhuafa',
        'description': 'Sumbangkan makanan siap saji untuk kaum dhuafa.',
        'imageUrl': 'assets/post_2.png',
        'amount': 'Rp 400.000',
        'progress': 90,
      },
      {
        'title': 'Bantu Korban Gempa',
        'description': 'Donasi untuk korban gempa di wilayah timur Indonesia.',
        'imageUrl': 'assets/post_6.png',
        'amount': 'Rp 2.000.000',
        'progress': 10,
      },
    ];


    @override
    Widget build(BuildContext context) {
        return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: donations.length,
            itemBuilder: (context, index) {
                final donation = donations[index];
                return CardRectangle(
                    title: donation['title'],
                    progress: (donation['progress'] as num).toDouble(),
                    image: donation['imageUrl'],
                    description: donation['description'],
                    amount: donation['amount'],
                );
            },
        );
    }
}