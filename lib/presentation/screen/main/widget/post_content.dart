import 'package:flutter/material.dart';
import 'package:one_goal/presentation/widget/card/card_rectangle.dart';

class PostContent extends StatelessWidget {
    const PostContent({super.key});

    @override
    Widget build(BuildContext context) {
        return Column(
            children: [
                const SizedBox(height: 20),
                CardRectangle(
                    image: 'assets/post_1.png',
                    title: 'Post Title 1',
                ),
                const SizedBox(height: 20),
                CardRectangle(
                    image: 'assets/post_2.png',
                    title: 'Post Title 1',
                ),
                const SizedBox(height: 20),
                CardRectangle(
                    image: 'assets/post_3.png',
                    title: 'Post Title 1',
                ),
                const SizedBox(height: 20),
                CardRectangle(
                    image: 'assets/post_4.png',
                    title: 'Post Title 1',
                ),
                const SizedBox(height: 20),
                CardRectangle(
                    image: 'assets/post_5.png',
                    title: 'Post Title 1',
                ),
                const SizedBox(height: 20),
                CardRectangle(
                    image: 'assets/post_6.png',
                    title: 'Post Title 1',
                )
            ],
        );
    }
}