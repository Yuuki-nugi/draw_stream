import 'package:draw_stream/drawing_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'draw_stream_platform_interface.dart';

/// An implementation of [DrawStreamPlatform] that uses method channels.
class MethodChannelDrawStream extends DrawStreamPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('draw_stream');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<void> startDrawStream({
    required String videoPath,
    required String outputPath,
    required List<DrawingData> drawingDataList,
  }) async {
    await methodChannel.invokeMethod<void>(
      'startDrawStream',
      {
        'videoPath': videoPath,
        'outputPath': outputPath,
        'drawingDataList': drawingDataList.map((e) => e.toJson()).toList(),
      },
    );
  }

  @override
  Future<void> stopDrawStream() async {
    await methodChannel.invokeMethod<void>('stopDrawStream');
  }
}
