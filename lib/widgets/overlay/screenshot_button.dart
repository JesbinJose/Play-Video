
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:play_video/models/state.dart';

class ScreenShotButton extends StatelessWidget {
  const ScreenShotButton({
    super.key,
    required this.state,
  });

  final VideoPlayerState state;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        try {
          final image = await state.screenshot();
          if (image != null) {
            final v =
                await getApplicationCacheDirectory();
            File file = File(
              '${v.path}/screenshot/${state.state.duration.inMilliseconds}.jpg',
            );
            file.writeAsBytesSync(image);
            log('Image saved successfully!');
          }
        } catch (e) {
          log('Error: while taking or saving the screenshot');
          log('Error: $e');
        }
      },
      icon: const Icon(Icons.image_outlined),
    );
  }
}
