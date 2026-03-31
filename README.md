# notification_cleaner

A Flutter plugin to **clear all notifications**, supporting modern platform implementations with proper permission handling.

> 🚀 Maintained and updated fork of [clear_all_notifications](https://pub.dev/packages/clear_all_notifications)

---

## ✨ Features

* Clear all notifications from the notification tray
* Supports modern Android versions (including Android 13+)
* Works with iOS (subject to platform limitations)
* Simple and minimal API
* Lightweight and fast

---

## 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  notification_cleaner: ^0.0.4
```

Then run:

```bash
flutter pub get
```

---

## ⚙️ Setup

### Android

Add permission in `android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.POST_NOTIFICATIONS"/>
```

Request permission at runtime (Android 13+):

```dart
import 'package:permission_handler/permission_handler.dart';

await Permission.notification.request();
```

---

### iOS

No additional setup is required.

> ⚠️ Note: iOS has system limitations on managing notifications. Behavior may vary compared to Android.

---

## 🚀 Usage

```dart
import 'package:notification_cleaner/notification_cleaner.dart';

await NotificationCleaner.clearAllNotifications();
```

---

## 📱 Example

```dart
ElevatedButton(
  onPressed: () async {
    await NotificationCleaner.clearAllNotifications();
  },
  child: const Text("Clear Notifications"),
)
```

---

## 📚 API

### clearAllNotifications()

Clears all notifications from the device notification tray.

```dart
Future<void> clearAllNotifications()
```

---

## 📝 Notes

* Behavior may differ between Android and iOS due to platform restrictions
* On Android 13+, notification permission is required
* Some device manufacturers may restrict background notification access

---

## 🤝 Contributing

Contributions are welcome!
Feel free to open issues or submit pull requests.

---

## 🔗 Links

* GitHub Repository: https://github.com/mr-gami001/notification_cleaner
* Issue Tracker: https://github.com/mr-gami001/notification_cleaner/issues
* pub.dev: https://pub.dev/packages/notification_cleaner

---

## 📄 License

This project is licensed under the MIT License.

---

## ❤️ Acknowledgements

This package is a maintained fork of `clear_all_notifications`.
Thanks to the original authors for their work.
