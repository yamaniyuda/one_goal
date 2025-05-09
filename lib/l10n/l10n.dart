import 'package:flutter/material.dart';


class L10n {
    static const Map<String, Locale> all = {
        'en': Locale('en'),
        'id': Locale('id'),
        'ja': Locale('ja'),
        'zh': Locale('zh'),
    };

    static Locale? getByKey(String key) => all[key];
}