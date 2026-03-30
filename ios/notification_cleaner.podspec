#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint notification_cleaner.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'notification_cleaner'
  s.version          = '2.0.0'
  s.summary          = 'A modern Flutter plugin for clearing all active notifications on Android and iOS.'
  s.description      = <<-DESC
A modern Flutter plugin for clearing all active notifications on Android and iOS. This is a maintained fork of clear_all_notifications.
                       DESC
  s.homepage         = 'https://github.com/yourusername/notification_cleaner'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '8.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
