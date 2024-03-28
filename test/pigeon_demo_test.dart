import 'package:flutter_test/flutter_test.dart';
import 'package:pigeon_demo/pigeon_demo_platform_interface.dart';
import 'package:pigeon_demo/pigeon_demo_method_channel.dart';
import 'package:pigeon_demo/src/messages.g.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'test_api.g.dart';

class MockPigeonDemoPlatform
    with MockPlatformInterfaceMixin
    implements PigeonDemoPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

class FakeApi implements TestApi {
  @override
  Future<PigeonStats> getPigeonStats() {
    // TODO: implement getPigeonStats
    throw UnimplementedError();

  }

  @override
  String makePigeonSpeak(String text) {
    // TODO: implement makePigeonSpeak
      throw UnimplementedError();
  }

  @override
  void pokePigeon() {
    // TODO: implement pokePigeon
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final PigeonDemoPlatform initialPlatform = PigeonDemoPlatform.instance;

  final fakeDemoApi = FakeApi();

  test('$MethodChannelPigeonDemo is the default instance', () {
    fakeDemoApi.getPigeonStats();
    expect(initialPlatform, isInstanceOf<MethodChannelPigeonDemo>());
  });
}
