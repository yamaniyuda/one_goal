import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_goal/presentation/screen/main/models/category_model.dart';

class CategoryList extends StatelessWidget {
    const CategoryList({super.key});





    @override
    Widget build(BuildContext context) {
          final List<CategoryModel> categories = [
            CategoryModel(image: 'assets/icons/icon_heart.png', name: AppLocalizations.of(context)!.health, link: ''),
            CategoryModel(image: 'assets/icons/icon_disaster.png', name: AppLocalizations.of(context)!.disaster, link: ''),
            CategoryModel(image: 'assets/icons/icon_arm_wrestling.png', name: AppLocalizations.of(context)!.together, link: ''),
            CategoryModel(image: 'assets/icons/icon_learning.png', name: AppLocalizations.of(context)!.education, link: ''),
            CategoryModel(image: 'assets/icons/forest.png', name: AppLocalizations.of(context)!.forest, link: ''),
            CategoryModel(image: 'assets/icons/children.png', name: AppLocalizations.of(context)!.children, link: ''),
            CategoryModel(image: 'assets/icons/nursing-home.png', name: AppLocalizations.of(context)!.elderly, link: ''),
        ];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            Text(
                                AppLocalizations.of(context)!.category,
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
                            const SizedBox(width: 25),
                            ...categories.map((category) => Padding(
                                padding: const EdgeInsets.only(right: 38),
                                child: Column(
                                    children: [
                                        Image.asset(
                                            category.image,
                                            width: 30,
                                            height: 30,
                                        ),
                                        const SizedBox(height: 8),
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