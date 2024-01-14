import 'dart:io';

import 'package:draw_stream/drawing_data.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:draw_stream/draw_stream.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends HookWidget {
  final _drawStreamPlugin = DrawStream();

  @override
  Widget build(BuildContext context) {
    final outputVideoPath = useState<String?>(null);
    final controller = useState<VideoPlayerController?>(null);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    final ImagePicker picker = ImagePicker();
                    // Pick an image.
                    final XFile? video =
                        await picker.pickVideo(source: ImageSource.gallery);
                    if (video != null) {
                      final videoFileName = video.name;

                      Directory tmpDocDir = await getTemporaryDirectory();
                      String tmpDocPath = tmpDocDir.path;
                      String outputPath = '$tmpDocPath/$videoFileName.mp4';

                      final drawingDataList = List<DrawingData>.filled(
                          120,
                          DrawingData(
                            circles: [
                              CircleData(
                                  center: const Offset(100, 100),
                                  radius: 20,
                                  color: Colors.red,
                                  strokeWidth: 20)
                            ],
                            lines: [
                              LineData(
                                  start: const Offset(100, 100),
                                  end: const Offset(200, 200),
                                  color: Colors.red,
                                  strokeWidth: 20)
                            ],
                          ));
                      try {
                        await _drawStreamPlugin.startDrawStream(
                          videoPath: video.path,
                          outputPath: outputPath,
                          drawingDataList: drawingDataList,
                        );
                        controller.value =
                            VideoPlayerController.file(File(outputPath));

                        controller.value!.setLooping(true);
                        controller.value!.initialize();
                        controller.value!.play();
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(e.toString())));
                      }
                    }
                  },
                  child: Text('startDrawStream'),
                ),
              ),
              if (controller.value != null)
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      VideoPlayer(controller.value!),
                      VideoProgressIndicator(controller.value!,
                          allowScrubbing: true),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
