import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:notification_cleaner/notification_cleaner.dart';

void main() {
  const MethodChannel channel = MethodChannel('notification_cleaner');

  TestWidgetsFlutterBinding.ensureInitialized();

  final List<MethodCall> log = <MethodCall>[];

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      log.add(methodCall);
      if (methodCall.method == 'clearAllNotifications') {
        return null;
      }
      return null;
    });
    log.clear();
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('clearAllNotifications calls the platform channel (iOS verification)', () async {
    // This test verifies that the Dart code correctly triggers the method channel,
    // which is the common entry point for both Android and iOS.
    await NotificationCleaner.clearAllNotifications();
    expect(
      log,
      <Matcher>[
        isMethodCall('clearAllNotifications', arguments: null),
      ],
    );
  });

  test('clearAllNotifications handles iOS-specific errors', () async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      if (methodCall.method == 'clearAllNotifications') {
        throw PlatformException(code: 'UNSUPPORTED', message: 'iOS version not supported');
      }
      return null;
    });

    expect(
      () => NotificationCleaner.clearAllNotifications(),
      throwsA(isA<Exception>().having((e) => e.toString(), 'message', contains('iOS version not supported'))),
    );
  });
}
