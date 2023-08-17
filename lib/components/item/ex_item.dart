import 'package:ex_widget/extensions/padding.extension.dart';
import 'package:ex_widget/extensions/text.extension.dart';
import 'package:flutter/material.dart';

class EXItem extends StatefulWidget {
  final String label;
  final String? contentText;
  final Widget? prefix;
  final Widget? suffix;
  final VoidCallback? onTap;
  const EXItem({
    super.key,
    required this.label,
    this.contentText = "",
    this.prefix,
    this.suffix,
    this.onTap,
  });

  @override
  State<EXItem> createState() => _EXItemState();
}

class _EXItemState extends State<EXItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
        child: Flex(
          direction: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.suffix == null ? Container() : widget.suffix!.pr(16),
            Text(widget.label).fontSize(16).pr(16),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(widget.contentText!).fontSize(16).color(const Color(0xff808080)).pr(16),
              ),
            ),
            widget.suffix == null ? Container() : widget.suffix!,
          ],
        ),
      ),
    );
  }
}
