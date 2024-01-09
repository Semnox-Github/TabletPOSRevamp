import 'package:flutter/widgets.dart';

class KeyboardHider extends StatelessWidget {

  final Widget child;

  const KeyboardHider({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: child,
    );
  }
}