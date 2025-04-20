import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/icon_park_twotone.dart';
import 'package:one_goal/presentation/screen/main/widget/category_list.dart';
import 'package:one_goal/presentation/screen/main/widget/populer_content.dart';
import 'package:one_goal/presentation/screen/main/widget/post_content_video.dart';
import 'package:one_goal/presentation/screen/main/widget/post_content.dart';


class HomeContent extends StatelessWidget {
    const HomeContent({super.key});

    @override
    Widget build(BuildContext context) {
        final screenWidth = MediaQuery.of(context).size.width;

        return Stack(
            clipBehavior: Clip.none, 
            children: [

                Container(
                    margin: const EdgeInsets.only(top: 50),
                    width: screenWidth,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                        ),
                        border: Border.all(
                            color: Colors.grey,
                        ),
                    ),
                    child: Column(
                        children: [
                            const SizedBox(height: 50),
                            const PopulerContent(),
                            CategoryList(),
                            const SizedBox(height: 20),
                            PostContentVideo(),
                            PostContent(),
                            const SizedBox(height: 100),
                        ],
                    ),
                ),


                Positioned(
                    top: 0,
                    left: 20,
                    right: 20,
                    child: Container(
                        height: 90,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: Colors.grey,
                            ),
                        ),
                        child: Row(
                            children: [
                                Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Theme.of(context).primaryColor,
                                                borderRadius: BorderRadius.circular(100),
                                            ),
                                            child: Iconify(IconParkTwotone.wallet_one, color: Colors.white),
                                        ),
                                        const SizedBox(width: 20),
                                        Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                                Text(
                                                    'Total Saldo',
                                                    style: GoogleFonts.inter(
                                                        fontSize: 14
                                                    ),
                                                ),
                                                Text(
                                                    'Rp 20.000.000',
                                                    style: GoogleFonts.inter(
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold
                                                    ),
                                                ),

                                            ],
                                        )
                                    ],
                                )
                            ],
                        )
                    ),
                ),
            ],
        );
    }
}
