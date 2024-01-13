import 'package:draw_stream/drawing_data.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'draw_stream_method_channel.dart';

abstract class DrawStreamPlatform extends PlatformInterface {
  /// Constructs a DrawStreamPlatform.
  DrawStreamPlatform() : super(token: _token);

  static final Object _token = Object();

  static DrawStreamPlatform _instance = MethodChannelDrawStream();

  /// The default instance of [DrawStreamPlatform] to use.
  ///
  /// Defaults to [MethodChannelDrawStream].
  static DrawStreamPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DrawStreamPlatform] when
  /// they register themselves.
  static set instance(DrawStreamPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> startDrawStream({
    required String videoPath,
    required String outputPath,
    required List<DrawingData> drawingDataList,
  }) {
    throw UnimplementedError('startDrawStream() has not been implemented.');
  }

  Future<void> stopDrawStream() {
    throw UnimplementedError('stopDrawStream() has not been implemented.');
  }
}
