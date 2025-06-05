import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:one_goal/presentation/screen/notification/provider/notification_provider.dart';
import 'package:provider/provider.dart';

class NewsContent extends StatelessWidget {
    const NewsContent({super.key});

    @override
    Widget build(BuildContext context) {
        return Consumer<NotificationProvider>(
            builder: (context, provider, child) {
                final notifications = provider.newsNotifications;
                if (notifications.isEmpty) {
                    return Center(child: Text('No notifications'));
                }
                return ListView.builder(
                    itemCount: notifications.length,
                    itemBuilder: (context, index) {
                        final notification = notifications[index];

                        return ListTile(
                            leading: CircleAvatar(
                                backgroundColor: Colors.grey[200],
                                child: Iconify(
                                    notification.icon,
                                    color: Theme.of(context).primaryColor,
                                    size: 24,
                                ),
                            ),
                            title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                    Text(notification.title),
                                    Text(
                                        notification.time,
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                        ),
                                    ),
                                ],
                            ),
                            subtitle: Text(
                                notification.subtitle,
                                style: TextTheme.of(context).bodyLarge?.copyWith(
                                    color: Colors.grey[600],
                                ),
                            ),
                        );
                    },
                );
            },
        );
    }
}