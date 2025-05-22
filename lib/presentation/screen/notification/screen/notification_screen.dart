import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_goal/presentation/screen/notification/provider/notification_provider.dart';
import 'package:one_goal/presentation/screen/notification/widget/all_content.dart';
import 'package:one_goal/presentation/screen/notification/widget/donation_content.dart';
import 'package:one_goal/presentation/screen/notification/widget/news_content.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
    const NotificationScreen({super.key});

    @override
    State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
    @override
    Widget build(BuildContext context) {
        return ChangeNotifierProvider(
            create: (_) => NotificationProvider(),
            child: DefaultTabController(
                length: 3,
                initialIndex: 0,
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
                            AllContent(),
                            DonationContent(),
                            NewsContent(),
                        ],
                    ),
                ),
            ),
        );
    }
}