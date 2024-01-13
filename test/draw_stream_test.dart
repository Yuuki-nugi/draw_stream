import 'package:draw_stream/drawing_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:draw_stream/draw_stream.dart';
import 'package:draw_stream/draw_stream_platform_interface.dart';
import 'package:draw_stream/draw_stream_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDrawStreamPlatform
    with MockPlatformInterfaceMixin
    implements DrawStreamPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<void> startDrawStream(
      {required String videoPath,
      required String outputPath,
      required List<DrawingData> drawingDataList}) {
    return Future.value();
  }

  @override
  Future<void> stopDrawStream() {
    return Future.value();
  }
}

void main() {
  final DrawStreamPlatform initialPlatform = DrawStreamPlatform.instance;

  test('$MethodChannelDrawStream is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDrawStream>());
  });

  test('getPlatformVersion', () async {
    DrawStream drawStreamPlugin = DrawStream();
    MockDrawStreamPlatform fakePlatform = MockDrawStreamPlatform();
    DrawStreamPlatform.instance = fakePlatform;

    expect(await drawStreamPlugin.getPlatformVersion(), '42');
  });

  test('startDrawStream', () async {
    DrawStream drawStreamPlugin = DrawStream();
    MockDrawStreamPlatform fakePlatform = MockDrawStreamPlatform();
    DrawStreamPlatform.instance = fakePlatform;

    // Make sure it works for now
    await drawStreamPlugin.startDrawStream(
      videoPath: 'videoPath',
      outputPath: 'outputPath',
      drawingDataList: [],
    );
  });

  test('stopDrawStream', () async {
    DrawStream drawStreamPlugin = DrawStream();
    MockDrawStreamPlatform fakePlatform = MockDrawStreamPlatform();
    DrawStreamPlatform.instance = fakePlatform;

    // Make sure it works for now
    await drawStreamPlugin.stopDrawStream();
  });
}
