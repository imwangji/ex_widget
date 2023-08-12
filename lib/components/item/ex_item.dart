import 'dart:js_interop';

import 'package:ex_widget/extensions/padding.extension.dart';
import 'package:ex_widget/extensions/text.extension.dart';
import 'package:flutter/material.dart';

class EXItem extends StatefulWidget {
  final String label;
  final String? contentText;
  final Widget? prefix;
  final Widget? suffix;
  const EXItem({super.key, required this.label, this.contentText = "", this.prefix, this.suffix});

  @override
  State<EXItem> createState() => _EXItemState();
}

class _EXItemState extends State<EXItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 25),
      child: Flex(
        direction: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.suffix.isNull ? Container() : widget.suffix!.pr(32),
          Text(widget.label).fontSize(32).pr(32),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(widget.contentText!).fontSize(32).color(const Color(0xff808080)).pr(32),
            ),
          ),
          widget.suffix.isNull ? Container() : widget.suffix!,
        ],
      ),
    );
  }
}
