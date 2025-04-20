import 'package:flutter/material.dart';
// import 'package:one_goal/presentation/screen/auth/screen/sign_up.dart';


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
            body: widgetOptions.elementAt(_selectedIndex),
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                items: const <BottomNavigationBarItem> [
                    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                    BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Tambah'),
                    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
                ],
            ),
        );
    }
}