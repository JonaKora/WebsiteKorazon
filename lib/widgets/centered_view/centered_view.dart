import 'package:flutter/material.dart';

class CenteredView extends StatelessWidget {
  final Widget child;
  const CenteredView({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final hPad = w < 700 ? 16.0 : 32.0;

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: hPad),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1000,
            minWidth: 0, // <-- allow shrinking
          ),
          child: child,
        ),
      ),
    );
  }
}
