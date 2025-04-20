import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_goal/presentation/screen/main/models/category_model.dart';

class CategoryList extends StatelessWidget {
    CategoryList({super.key});


    final List<CategoryModel> categories = [
        CategoryModel(image: 'assets/icons/icon_heart.png', name: 'Kesehatan', link: ''),
        CategoryModel(image: 'assets/icons/icon_disaster.png', name: 'Bencana', link: ''),
        CategoryModel(image: 'assets/icons/icon_arm_wrestling.png', name: 'Bersama', link: ''),
        CategoryModel(image: 'assets/icons/icon_learning.png', name: 'Pendidikan', link: ''),
        CategoryModel(image: 'assets/icons/forest.png', name: 'Hutan', link: ''),
        CategoryModel(image: 'assets/icons/children.png', name: 'Anak-anak', link: ''),
        CategoryModel(image: 'assets/icons/nursing-home.png', name: 'Lansia', link: ''),
    ];


    @override
    Widget build(BuildContext context) {
        return Column(
            children: [
                Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            Text(
                                'Kategori',
                                style: GoogleFonts.inter(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                ),
                            )
                        ],
                    ),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                            const SizedBox(width: 20),
                            ...categories.map((category) => Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Column(
                                    children: [
                                        Image.asset(
                                            category.image,
                                            width: 30,
                                            height: 30,
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                            category.name,
                                            style: GoogleFonts.inter(fontSize: 14),
                                        ),
                                    ],
                                ),
                            )),
                        ],
                    ),
                ),
            ],
        );
    }
}