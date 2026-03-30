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

  test('clearAllNotifications calls the platform channel', () async {
    await NotificationCleaner.clearAllNotifications();
    expect(
      log,
      <Matcher>[
        isMethodCall('clearAllNotifications', arguments: null),
      ],
    );
  });

  test('clearAllNotifications throws exception on PlatformException', () async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      throw PlatformException(code: 'ERROR', message: 'Failed to clear');
    });

    expect(
      () => NotificationCleaner.clearAllNotifications(),
      throwsA(isA<Exception>().having((e) => e.toString(), 'message', contains('Failed to clear'))),
    );
  });
}
