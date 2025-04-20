import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/icon_park_twotone.dart';

class CardVideo extends StatefulWidget {
    final ImageProvider image;
    final double width;
    final double height;

    const CardVideo({
        super.key,
        required this.image,
        required this.width,
        required this.height,
    });

  @override
  State<CardVideo> createState() => _CardVideoState();
}

class _CardVideoState extends State<CardVideo> {
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
                child: Stack(
                    children: [
                        Center(
                            child: Iconify(
                                IconParkTwotone.play,
                                color: Colors.white,
                                size: 50,
                            ),
                        ),
                        Positioned(
                            bottom: 10,
                            left: 10,
                            child: Text(
                                '2 Hari yang lalu',
                                style: GoogleFonts.inter(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                ),
                            ),
                        ),
                    ],
                )
            ),
        );;
    }
}