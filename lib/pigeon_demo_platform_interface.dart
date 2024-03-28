import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'pigeon_demo_method_channel.dart';

abstract class PigeonDemoPlatform extends PlatformInterface {
  /// Constructs a PigeonDemoPlatform.
  PigeonDemoPlatform() : super(token: _token);

  static final Object _token = Object();

  static PigeonDemoPlatform _instance = MethodChannelPigeonDemo();

  /// The default instance of [PigeonDemoPlatform] to use.
  ///
  /// Defaults to [MethodChannelPigeonDemo].
  static PigeonDemoPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PigeonDemoPlatform] when
  /// they register themselves.
  static set instance(PigeonDemoPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
