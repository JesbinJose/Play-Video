import 'package:flutter/material.dart';
import 'package:play_video/models/state.dart';
import 'package:play_video/models/theme.dart';

final ValueNotifier<BoxFit> fitNotifier = ValueNotifier(BoxFit.none);

class MoreSettingsWidget extends StatelessWidget {
  const MoreSettingsWidget({
    super.key,
    required this.state,
    required this.theme,
  });

  final VideoPlayerState state;
  final PlayerTheme theme;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: state.moreOpacityNotifier,
      builder: (context, opacity, child) {
        if (opacity == 0) {
          return const SizedBox.shrink();
        }
        return AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(milliseconds: 500),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.black45,
            ),
            child: LayoutBuilder(builder: (context, layout) {
              // final Size size = MediaQuery.sizeOf(context);
              // final bool isHorizontal = size.height < size.width;
              return Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => state.moreOpacityNotifier.value = 0,
                        icon: const Icon(Icons.arrow_back_ios_new_rounded),
                      ),
                      const Text(
                        'More settings',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                    child: ValueListenableBuilder(
                        valueListenable: fitNotifier,
                        builder: (_, v, __) {
                          List<BoxFit> fit = [
                            BoxFit.contain,
                            BoxFit.cover,
                            BoxFit.fill,
                            BoxFit.none
                          ];
                          return ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Text(
                                  'Size',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              ...List.generate(
                                fit.length,
                                (index) => InkWell(
                                  onTap: () {
                                    fitNotifier.value = fit[index];
                                    state.update(fit: fit[index]);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    child: Text(
                                      fit[index].name,
                                      style: TextStyle(
                                        color: fit.indexOf(v) == index
                                            ? Colors.red
                                            : Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                ],
              );
            }),
          ),
        );
      },
    );
  }
}
