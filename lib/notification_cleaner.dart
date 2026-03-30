import 'dart:async';

import 'package:flutter/services.dart';

/// A modern Flutter plugin for clearing all active notifications on Android and iOS.
class NotificationCleaner {
  static const MethodChannel _channel = MethodChannel('notification_cleaner');

  /// Clears all active notifications from the notification bar.
  /// 
  /// Throws a [PlatformException] if there's an error clearing notifications.
  static Future<void> clearAllNotifications() async {
    try {
      await _channel.invokeMethod('clearAllNotifications');
    } on PlatformException catch (e) {
      throw Exception('Failed to clear notifications: ${e.message}');
    }
  }
}
