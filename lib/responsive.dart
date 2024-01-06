import 'package:flutter/widgets.dart';

class Responsive {
  static Widget responsive(
    BuildContext context, {
    required Widget small,
    required Widget large,
  }) {
    final Size size = MediaQuery.sizeOf(context);
    if (size.width < 500) {
      return small;
    } else {
      return large;
    }
  }
}
