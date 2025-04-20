import 'package:flutter/material.dart';
import 'package:one_goal/presentation/widget/card/card_video.dart';

class PostContentVideo extends StatelessWidget {
    const PostContentVideo({super.key});

    @override
    Widget build(BuildContext context) {
        return Container(
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: [
                        const SizedBox(width: 20),
                        CardVideo(
                            height: 280,
                            width: 200,
                            image: AssetImage('assets/video_3.png'),
                        ),
                        SizedBox(width: 10),
                        CardVideo(
                            height: 280,
                            width: 200,
                            image: AssetImage('assets/video_2.png'),
                        ),
                        SizedBox(width: 10),
                        CardVideo(
                            height: 280,
                            width: 200,
                            image: AssetImage('assets/video_4.png'),
                        ),
                        SizedBox(width: 10),
                        CardVideo(
                            height: 280,
                            width: 200,
                            image: AssetImage('assets/video_1.png'),
                        ),
                        SizedBox(width: 10),
                    ],
                ),
            ),
        );
    }
}