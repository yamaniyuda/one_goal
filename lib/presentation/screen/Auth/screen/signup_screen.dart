import 'package:flutter/material.dart';
import 'package:one_goal/presentation/screen/Auth/auth.dart';


class UpScreen extends StatefulWidget {
    const UpScreen({super.key});

    @override
    State<UpScreen> createState() => _UpScreenState();
}




class _UpScreenState extends State<UpScreen> {
    int _selectedIndex = 0;


    final List<Widget> widgetOptions = [
        // CreateAccountPage(),
        // CreateAccountPage(),
        // CreateAccountPage()
    ];


    void _onItemTapped(int index) {
        setState(() {
            _selectedIndex = index;
        });
    }


    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: CreateAccountPage()
        );
    }
}