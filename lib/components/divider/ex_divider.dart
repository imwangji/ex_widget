import 'package:flutter/material.dart';

class EXDivider extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  const EXDivider({
    super.key,
    this.padding = const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      child: Divider(
        height: 1,
        color: const Color(0xff1a1a1a).withOpacity(0.08),
      ),
    );
  }
}
