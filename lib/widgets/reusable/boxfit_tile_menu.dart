import 'package:flutter/material.dart';
import 'package:play_video/models/state.dart';
import 'package:play_video/models/theme.dart';
// import 'package:play_video/widgets/overlay/more_settings_widget.dart';

final ValueNotifier<BoxFit> _fitNotifier = ValueNotifier(BoxFit.contain);

class BoxFitControlTile extends StatelessWidget {
  const BoxFitControlTile({
    super.key,
    required this.state,
    required this.theme,
    this.title= 'Size -',
  });

  final VideoPlayerState state;
  final PlayerTheme theme;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ValueListenableBuilder(
        valueListenable: _fitNotifier,
        builder: (_, v, __) {
          List<BoxFit> fit = [
            BoxFit.contain,
            BoxFit.cover,
            BoxFit.fill,
          ];
          return ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
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
              ...List.generate(
                fit.length,
                (index) => InkWell(
                  onTap: () {
                    _fitNotifier.value = fit[index];
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
          );
        },
      ),
    );
  }
}
