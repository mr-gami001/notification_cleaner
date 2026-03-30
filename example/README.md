# notification_cleaner_example

This application demonstrates how to use the `notification_cleaner` plugin to clear all active notifications from the notification bar.

## Features Illustrated

* **Permission Handling**: Proper request flow for `POST_NOTIFICATIONS` on Android 13+.
* **API Usage**: Simple call to `NotificationCleaner.clearAllNotifications()`.
* **State Management**: Handling loading states while performing native operations.
* **Modern UI**: Implementation using Material 3 design principles.

## Getting Started

1. Ensure you have Flutter installed.
2. Run `flutter pub get` in this directory.
3. Connect an Android or iOS device.
4. Run `flutter run`.

## Android Requirements

- **minSdkVersion**: 21
- **targetSdkVersion**: 34
- **compileSdkVersion**: 36
