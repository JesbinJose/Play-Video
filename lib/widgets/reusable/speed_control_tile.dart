import 'package:flutter/material.dart';
import 'package:play_video/models/state.dart';
import 'package:play_video/models/theme.dart';

class SpeedControlTile extends StatelessWidget {
  const SpeedControlTile({
    super.key,
    required this.state,
    this.title = 'Speed -',
    required this.theme,
  });

  final VideoPlayerState state;
  final String title;
  final PlayerTheme theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ValueListenableBuilder(
        valueListenable: state.speedNotifer,
        builder: (_, v, __) {
          List<double> speed = [0.5, 1.0, 1.5, 2];
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text(
                  title,
                  style: theme.menuItemTitleStyle,
                ),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width*.55,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        speed.length,
                        (index) => InkWell(
                          onTap: () {
                            state.setSpeed(speed[index]);
                            state.play();
                            state.moreOpacityNotifier.value = 0.0;
                          },
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Text(
                                  '${speed[index]}x',
                                  style: speed.indexOf(v) == index
                                      ? theme.menuSelectedItemStyle
                                      : theme.menuItemStyle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
            ],
          );
        },
      ),
    );
  }
}
