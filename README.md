# Notification Cleaner

A modern Flutter plugin for clearing all active notifications from the notification bar on Android and iOS.

> [!NOTE]
> This is a maintained fork of `clear_all_notifications`, updated for Dart 3, Null Safety, and modern Android SDKs.

## Features

* **One-tap Clear**: Easily clear all active notifications.
* **Modern Android Support**: Compatible with Android 13+ (API 33+) and `POST_NOTIFICATIONS` permissions.
* **Dart 3 Ready**: Full null safety and Dart 3 compliance.
* **Clean API**: Minimal and easy-to-use interface.

## Installation

Add `notification_cleaner` to your `pubspec.yaml`:

```yaml
dependencies:
  notification_cleaner: ^0.0.1
```

## Android Setup

### Permissions

For Android 13 (API level 33) and higher, you should request the `POST_NOTIFICATIONS` permission if you haven't already, although `cancelAll()` technically works without it on most devices, it's good practice to ensure your app has notification access.

Add this to your `AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.POST_NOTIFICATIONS" />
```

## Usage

```dart
import 'package:notification_cleaner/notification_cleaner.dart';

// Clear all notifications
try {
  await NotificationCleaner.clearAllNotifications();
  print("Notifications cleared!");
} catch (e) {
  print("Error: $e");
}
```

## Example

Check the [example](example/lib/main.dart) folder for a complete implementation with permission handling.

## License

This project is licensed under the Apache License 2.0.
