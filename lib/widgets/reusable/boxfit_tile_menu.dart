import 'package:flutter/material.dart';
import 'package:play_video/models/notifiers.dart';
import 'package:play_video/models/state.dart';
import 'package:play_video/models/theme.dart';
// import 'package:play_video/widgets/overlay/more_settings_widget.dart';

class BoxFitControlTile extends StatelessWidget {
  const BoxFitControlTile({
    super.key,
    required this.state,
    required this.theme,
    this.title = 'Size -',
  });

  final VideoPlayerState state;
  final PlayerTheme theme;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: ValueListenableBuilder(
        valueListenable: AllNotifiers.fitNotifier,
        builder: (_, v, __) {
          List<BoxFit> fit = [
            BoxFit.contain,
            BoxFit.cover,
            BoxFit.fill,
          ];
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
                width: MediaQuery.sizeOf(context).width * .55,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        fit.length,
                        (index) => InkWell(
                          onTap: () {
                            AllNotifiers.fitNotifier.value = fit[index];
                            state.update(fit: fit[index]);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Text(
                              fit[index].name,
                              style: fit.indexOf(v) == index
                                  ? theme.menuSelectedItemStyle
                                  : theme.menuItemStyle,
                            ),
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
