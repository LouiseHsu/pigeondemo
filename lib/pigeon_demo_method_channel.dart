import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'pigeon_demo_platform_interface.dart';

/// An implementation of [PigeonDemoPlatform] that uses method channels.
class MethodChannelPigeonDemo extends PigeonDemoPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('pigeon_demo');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
