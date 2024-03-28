import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/src/messages.g.dart',
  dartTestOut: 'test/test_api.g.dart',
  objcHeaderOut: 'ios/Classes/messages.g.h',
  objcSourceOut: 'ios/Classes/messages.g.m',
  swiftOut: 'ios/Classes/messages.g.swift',
  copyrightHeader: 'pigeons/copyright.txt',
))

@SwiftClass()
class PigeonStats {
  PigeonStats({
    required this.weight,
    required this.name
});

  final int weight;
  final String name;
}

@HostApi(dartHostTestHandler: "TestApi")
abstract class DemoApi {
  void pokePigeon();
  String makePigeonSpeak(String text);

  @async
  PigeonStats getPigeonStats();
}

