import 'package:flutter/material.dart';

class LockScreen extends StatelessWidget {
  const LockScreen({
    super.key,
    required this.opacity,
    required this.lockNotifier,
  });
  final double opacity;
  final ValueNotifier<bool> lockNotifier;

  @override
  Widget build(BuildContext context) {
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
              lockNotifier.value = false;
            },
            icon: const Icon(
              Icons.lock_open,
            ),
          ),
        ),
      ),
    );
  }
}
