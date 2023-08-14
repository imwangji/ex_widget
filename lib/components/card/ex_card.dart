import 'package:flutter/material.dart';

class EXCard extends StatefulWidget {
  final Widget child;
  final Color? borderColor;
  final Color? backgroundColor;
  const EXCard({
    super.key,
    required this.child,
    this.borderColor = const Color.fromRGBO(0, 0, 0, 0.08),
    this.backgroundColor = Colors.white,
  });

  @override
  State<EXCard> createState() => _EXCardState();
}

class _EXCardState extends State<EXCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: widget.borderColor!, width: .5),
      ),
      child: widget.child,
    );
  }
}
