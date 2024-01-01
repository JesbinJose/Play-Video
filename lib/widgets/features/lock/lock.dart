import 'package:flutter/material.dart';

class LockOverWidget extends StatelessWidget {
  const LockOverWidget({
    super.key,
    required this.isLocked,
    required this.color,
  });

  final ValueNotifier<bool> isLocked;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isLocked,
      builder: (_, v, __) {
        return Visibility(
          visible: v,
          child: Expanded(
            child: Container(
              color: color.withOpacity(0.1),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.lock_outline),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
