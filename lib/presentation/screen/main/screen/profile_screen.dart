import 'package:flutter/material.dart';
import 'package:one_goal/presentation/screen/main/widget/account_content.dart';
import 'package:one_goal/presentation/screen/main/widget/home_header.dart';
import 'package:one_goal/presentation/widget/background/circle_background.dart';

class ProfileScreen extends StatefulWidget {
    const ProfileScreen({super.key});

    @override
    State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
    
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
                                    AccountContent()
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
