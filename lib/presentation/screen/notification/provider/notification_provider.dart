import 'package:flutter/material.dart';
import 'package:iconify_flutter/icons/icon_park_twotone.dart';
import 'package:one_goal/data/models/models.dart' as models;


class NotificationProvider with ChangeNotifier{
    final List<models.Notification> _notifications = [
        models.Notification(
            title: 'Notification Title',
            subtitle: 'Notification Subtitle',
            time: '3h ago',
            icon: IconParkTwotone.newspaper_folding,
        ),
        models.Notification(
            title: 'Notification Title',
            subtitle: 'Notification Subtitle',
            time: '3h ago',
            icon: IconParkTwotone.bank_card,
        ),
        models.Notification(
            title: 'Notification Title',
            subtitle: 'Notification Subtitle',
            time: '3h ago',
            icon: IconParkTwotone.newspaper_folding,
        ),
        models.Notification(
            title: 'Notification Title',
            subtitle: 'Notification Subtitle',
            time: '3h ago',
            icon: IconParkTwotone.bank_card,
        ),
        models.Notification(
            title: 'Notification Title',
            subtitle: 'Notification Subtitle',
            time: '3h ago',
            icon: IconParkTwotone.newspaper_folding,
        ),
        models.Notification(
            title: 'Notification Title',
            subtitle: 'Notification Subtitle',
            time: '3h ago',
            icon: IconParkTwotone.bank_card,
        ),
        models.Notification(
            title: 'Notification Title',
            subtitle: 'Notification Subtitle',
            time: '3h ago',
            icon: IconParkTwotone.newspaper_folding,
        ),
        models.Notification(
            title: 'Notification Title',
            subtitle: 'Notification Subtitle',
            time: '3h ago',
            icon: IconParkTwotone.bank_card,
        ),
    ];


    List<models.Notification> get notifications => _notifications;
    List<models.Notification> get donationsNotifications => _notifications.where((notification) => notification.icon == IconParkTwotone.bank_card).toList();
    List<models.Notification> get newsNotifications => _notifications.where((notification) => notification.icon == IconParkTwotone.newspaper_folding).toList();
}