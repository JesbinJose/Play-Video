import 'package:flutter/material.dart';
import 'package:play_video/widgets/features/lock/lock.dart';
import 'package:play_video/models/models.dart';

// Class used to join every screens
class Player extends StatelessWidget {
  Player({
    super.key,
    required this.controller,
  });
  // controller for all the functionality
  final PlayVideoController controller;
  // For the lock feature
  final ValueNotifier<bool> isLocked = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      //stacking screens on evry top 
      child: Stack(
        children: [
          Container(),
          const SecondaryOverlayControl(),
          LockOverWidget(isLocked: isLocked,color: Colors.white,),
        ],
      ),
    );
  }
}

class SecondaryOverlayControl extends StatelessWidget {
  const SecondaryOverlayControl({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            child: Container(),
          ),
          Expanded(
            flex: 2,
            child: Container(),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
