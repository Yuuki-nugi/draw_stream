// You have generated a new plugin project without specifying the `--platforms`
// flag. A plugin project with no platform support was generated. To add a
// platform, run `flutter create -t plugin --platforms <platforms> .` under the
// same directory. You can also find a detailed instruction on how to add
// platforms in the `pubspec.yaml` at
// https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.

import 'package:draw_stream/drawing_data.dart';

import 'draw_stream_platform_interface.dart';

class DrawStream {
  Future<String?> getPlatformVersion() {
    return DrawStreamPlatform.instance.getPlatformVersion();
  }

  Future<void> startDrawStream({
    required String videoPath,
    required String outputPath,
    required List<DrawingData> drawingDataList,
  }) {
    return DrawStreamPlatform.instance.startDrawStream(
      videoPath: videoPath,
      outputPath: outputPath,
      drawingDataList: drawingDataList,
    );
  }

  Future<void> stopDrawStream() {
    return DrawStreamPlatform.instance.stopDrawStream();
  }
}
