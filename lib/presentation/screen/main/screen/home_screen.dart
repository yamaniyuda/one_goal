import 'package:flutter/material.dart';
import 'package:one_goal/presentation/screen/main/main.dart';
import 'package:one_goal/presentation/screen/main/widget/home_content.dart';
import 'package:one_goal/presentation/screen/main/widget/home_header.dart';
import 'package:one_goal/presentation/screen/main/widget/words_motivation.dart';
import 'package:one_goal/presentation/widget/background/circle_background.dart';
import 'package:one_goal/presentation/widget/widget.dart';



class BoxWidget extends StatelessWidget {
  const BoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.yellow,
        height: 100,
        width: 100,
        child: Align(
            alignment: Alignment.center,
            child: Container(
                color: Colors.red,
                height: 50,
                width: 50,
                ),
            ),
        );
    }
}


class HomeScreen extends StatefulWidget {
    const HomeScreen({super.key});

    @override
    State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {
    @override
    Widget build(BuildContext context) {
        return CircleBackground(
            child: Stack(
                children: [
                    SizedBox(
                        width: double.infinity,
                        child: SingleChildScrollView(
                            child: Column(
                                children: [
                                    const SizedBox(height: 130),
                                    const WordsMotivation(),
                                    const SizedBox(height: 20),
                                    const HomeContent()
                                ],
                            ),
                        ),
                    ),
                    const HomeHeader(),
                ],
            ),
        );
    }
}
