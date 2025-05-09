import 'package:flutter/material.dart';
import 'package:one_goal/presentation/screen/auth/auth.dart';


class UpScreen extends StatefulWidget {
    const UpScreen({super.key});

    @override
    State<UpScreen> createState() => _UpScreenState();
}




class _UpScreenState extends State<UpScreen> {


    final List<Widget> widgetOptions = [
        // CreateAccountPage(),
        // CreateAccountPage(),
        // CreateAccountPage()
    ];


    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: CreateAccountPage()
        );
    }
}