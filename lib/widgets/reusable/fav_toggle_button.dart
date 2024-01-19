// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:play_video/function/hive/favorite.dart';
import 'package:play_video/models/theme.dart';

class FavToggleButton extends StatelessWidget {
  final ValueNotifier<bool> _isFav = ValueNotifier(true);
  late FavouritesDataBase fav;
  final String path;
  final Widget? like;
  final Widget? unLike;
  final PlayerTheme? theme;
  FavToggleButton({
    required this.path,
    super.key,
    this.like,
    this.unLike,
    this.theme,
  }) {
    fav = FavouritesDataBase();
    _isFav.value = fav.isFav(path);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isFav,
      builder: (context, value, child) {
        return IconButton(
          onPressed: () async {
            if (!value) {
              await fav.addVideo(path);
            } else {
              await fav.remove(path);
            }
            _isFav.value = !value;
          },
          icon: value
              ? like ??
                  Icon(
                    Icons.favorite,
                    size: theme?.iconsSize,
                    color: theme?.iconsColor,
                  )
              : unLike ??
                  Icon(
                    Icons.favorite_border,
                    size: theme?.iconsSize,
                    color: theme?.iconsColor,
                  ),
        );
      },
    );
  }
}
