import 'package:flutter/material.dart';
import 'package:one_goal/presentation/screen/main/screen/home_screen.dart';


class MainScreen extends StatefulWidget {
    const MainScreen({super.key});

    @override
    State<MainScreen> createState() => _MainScreenState();
}




class _MainScreenState extends State<MainScreen> {
    int _selectedIndex = 0;


    final List<Widget> widgetOptions = const [
        HomeScreen(),
        HomeScreen(),
        HomeScreen()
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