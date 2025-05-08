import 'package:flutter/material.dart';
import 'package:one_goal/presentation/screen/main/widget/account_content.dart';
import 'package:one_goal/presentation/widget/background/circle_background.dart';
import '../widget/account_header.dart';

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
                    Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: SingleChildScrollView(
                            physics: NeverScrollableScrollPhysics(),
                            child: Column(
                                children: [
                                    AccountContent()
                                ],
                            ),
                        ),
                    ),
                    AccountHeader()
                ],
            ),
        );
    }
}