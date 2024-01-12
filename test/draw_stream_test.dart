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
}
