import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:play_video/models/state.dart';
import 'package:play_video/models/theme.dart';

final ValueNotifier<double> _overlayOpacityNotifier = ValueNotifier(1);
final ValueNotifier<double> _moreOpacityNotifier = ValueNotifier(0);
final ValueNotifier<bool> _lockNotifier = ValueNotifier(false);

class OverlayPlayer extends StatelessWidget {
  const OverlayPlayer({
    super.key,
    required this.state,
    required this.theme,
  });
  final VideoPlayerState state;
  final PlayerTheme theme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ValueListenableBuilder<double>(
          valueListenable: _overlayOpacityNotifier,
          builder: (context, opacity, child) {
            if (opacity == 0) {
              return InkWell(
                onTap: () => _overlayOpacityNotifier.value = 1,
                child: const SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                ),
              );
            }
            setTimer(
              const Duration(seconds: 3),
            );
            return ValueListenableBuilder(
              valueListenable: _lockNotifier,
              builder: (context, value, child) {
                if (value) {
                  return AnimatedOpacity(
                    opacity: opacity,
                    duration: const Duration(milliseconds: 500),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      padding: const EdgeInsets.all(
                        30,
                      ),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () {
                            _lockNotifier.value = false;
                          },
                          icon: const Icon(
                            Icons.lock_open,
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return AnimatedOpacity(
                  opacity: opacity,
                  duration: const Duration(milliseconds: 500),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.arrow_back_ios_new_rounded),
                          ),
                          IconButton(
                            onPressed: () {
                              _overlayOpacityNotifier.value = 0;
                            },
                            icon: const Icon(Icons.more_horiz),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => _lockNotifier.value = true,
                            icon: const Icon(Icons.lock),
                          ),
                          if (!kIsWeb)
                            IconButton(
                              onPressed: () async {
                                try {
                                  final image = await state.screenshot();
                                  if (image != null) {
                                    await getApplicationCacheDirectory().then(
                                      (v) {
                                        File file = File(
                                          '${v.path}/screenshot/${state.state.duration.inMilliseconds}.jpg',
                                        );
                                        file.writeAsBytesSync(image);
                                        log('Image saved successfully!');
                                      },
                                    );
                                  }
                                } catch (e) {
                                  log('Error: while taking or saving the screenshot');
                                  log('Error: $e');
                                }
                              },
                              icon: const Icon(Icons.image_outlined),
                            ),
                        ],
                      ),
                      Container(
                        color: theme.backgroundColor,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () => state.playOrPause(),
                                  icon: const Icon(
                                    Icons.play_arrow,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
        ValueListenableBuilder(
          valueListenable: _moreOpacityNotifier,
          builder: (context, opacity, child) {
            return Center(
              child: AnimatedOpacity(
                opacity: opacity,
                duration: const Duration(milliseconds: 500),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back_ios_new_rounded),
                        ),
                        IconButton(
                          onPressed: () {
                            _overlayOpacityNotifier.value = 0;
                          },
                          icon: const Icon(Icons.more_horiz),
                        ),
                      ],
                    ),
                    Row(
                      children: [],
                    ),
                    Row(
                      children: [],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Future<void> setTimer(Duration duration) async {
    await Future.delayed(duration);
    _overlayOpacityNotifier.value = 0;
  }
}
