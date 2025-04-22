import 'package:flutter/material.dart';
import 'package:one_goal/presentation/screen/Auth/auth.dart';
// import 'package:one_goal/presentation/screen/auth/screen/sign_in.dart';


class InScreen extends StatefulWidget {
    const InScreen({super.key});

    @override
    State<InScreen> createState() => _InScreenState();
}




class _InScreenState extends State<InScreen> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: LoginScreen(),
        );
    }
}