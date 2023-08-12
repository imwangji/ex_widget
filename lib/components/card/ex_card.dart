import 'package:flutter/material.dart';

class EXCard extends StatefulWidget {
  final Widget child;
  final Color? borderColor;
  const EXCard({super.key, required this.child, this.borderColor = const Color(0xFFB3B3B3)});

  @override
  State<EXCard> createState() => _EXCardState();
}

class _EXCardState extends State<EXCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: widget.borderColor!),
      ),
      child: widget.child,
    );
  }
}
