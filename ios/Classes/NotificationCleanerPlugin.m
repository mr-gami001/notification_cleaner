#import "NotificationCleanerPlugin.h"
#if __has_include(<notification_cleaner/notification_cleaner-Swift.h>)
#import <notification_cleaner/notification_cleaner-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "notification_cleaner-Swift.h"
#endif

@implementation NotificationCleanerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftNotificationCleanerPlugin registerWithRegistrar:registrar];
}
@end
