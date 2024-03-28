import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pigeon_demo/pigeon_demo_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelPigeonDemo platform = MethodChannelPigeonDemo();
  const MethodChannel channel = MethodChannel('pigeon_demo');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
