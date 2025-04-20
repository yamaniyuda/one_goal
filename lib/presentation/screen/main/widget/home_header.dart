import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_goal/presentation/widget/curved_edges/curved_edges.dart';

class HomeHeader extends StatelessWidget {
    const HomeHeader({super.key});

    @override
    Widget build(BuildContext context) {
        return ClipPath(
            clipper: CurvedEdges(),
            child: Stack(
                children: [
                    Container(
                        color: Theme.of(context).primaryColor,
                        height: 140,
                        child: Stack(
                            children: [
                                Positioned(
                                    top: -150,
                                    left: -300,
                                    child: CircleAvatar(
                                        radius: 200,
                                        backgroundColor: Colors.white.withValues(alpha: 0.1),
                                    ),
                                ),
                                Positioned(
                                    top: 100,
                                    right: -250,
                                    child: CircleAvatar(
                                        radius: 200,
                                        backgroundColor: Colors.white.withValues(alpha: 0.1),
                                    ),
                                ),
                                Positioned(
                                    top: -200,
                                    right: -300,
                                    child: CircleAvatar(
                                        radius: 200,
                                        backgroundColor: Colors.white.withValues(alpha: 0.1),
                                    ),
                                ),
                                Positioned(
                                    top: 300,
                                    right: 100,
                                    child: CircleAvatar(
                                        radius: 200,
                                        backgroundColor: Colors.white.withValues(alpha: 0.1),
                                    ),
                                ),
                                Positioned(
                                    top: MediaQuery.sizeOf(context).height - 400,
                                    right: -100,
                                    child: CircleAvatar(
                                        radius: 300,
                                        backgroundColor: Colors.white.withValues(alpha: 0.1),
                                    ),
                                ),
                            ],
                        ),
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20),
                        height: 140,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                                Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                        CircleAvatar(
                                            radius: 20,
                                            backgroundImage: AssetImage('assets/person_1.jpg'),
                                        ),
                                        const SizedBox(width: 10),
                                        Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children:  [
                                                Text(
                                                    'John Wayne',
                                                    style: GoogleFonts.inter(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.white,
                                                    ),
                                                ),
                                                Text(
                                                    'Good Morning, John!',
                                                    style: GoogleFonts.inter(
                                                        fontSize: 14,
                                                        color: Colors.white70,
                                                    ),
                                                ),
                                            ],
                                        ),
                                    ],
                                ),
                                Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                        Stack(
                                            children: [
                                                Icon(
                                                    Icons.notifications,
                                                    color: Colors.white,
                                                ),
                                                Positioned(
                                                    top: 0,
                                                    right: 0,
                                                    child: Container(
                                                        width: 8,
                                                        height: 8,
                                                        decoration: BoxDecoration(
                                                            color: Colors.red,
                                                            shape: BoxShape.circle,
                                                        ),
                                                    ),
                                                ),
                                            ],
                                        ),
                                        const SizedBox(width: 10),
                                        Icon(
                                            Icons.more_vert,
                                            color: Colors.white,
                                        ),
                                    ],
                                ),
                            ],
                        )
                    ),
                ],
            )
        );
    }
} 