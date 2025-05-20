import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatefulWidget {
    const NotificationScreen({super.key});

    @override
    State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
    @override
    Widget build(BuildContext context) {
        return DefaultTabController(
            length: 3,
            initialIndex: 1,
            child: Scaffold(
                appBar: AppBar(
                    title: Text(
                        'Notification',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                        ),
                    ),
                    bottom: const TabBar(
                        tabs: <Widget>[
                        Tab(text: 'All'),
                        Tab(text: "Donations"),
                        Tab(text: "News"),
                        ],
                    ),
                ),
                body: TabBarView(
                    children: <Widget>[
                        Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    Image.asset(
                                        'assets/maintenance.png',
                                        width: 300, 
                                        height: 300,
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                        'Under Maintenance',
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                ],
                            ),
                        ),
                        Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    Image.asset(
                                        'assets/maintenance.png',
                                        width: 300, 
                                        height: 300,
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                        'Under Maintenance',
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                ],
                            ),
                        ),
                        Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    Image.asset(
                                        'assets/maintenance.png',
                                        width: 300, 
                                        height: 300,
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                        'Under Maintenance',
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                ],
                            ),
                        )
                    ],
                ),
            ),
        );
    }
}