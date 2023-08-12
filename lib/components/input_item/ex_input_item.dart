import 'dart:js_interop';

import 'package:ex_widget/extensions/padding.extension.dart';
import 'package:ex_widget/extensions/text.extension.dart';
import 'package:flutter/material.dart';

class EXInputItem extends StatefulWidget {
  final String label;
  final String? hintText;
  final Widget? prefix;
  const EXInputItem({
    super.key,
    required this.label,
    this.hintText,
    this.prefix,
  });

  @override
  State<EXInputItem> createState() => _EXInputItemState();
}

class _EXInputItemState extends State<EXInputItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Flex(
        direction: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.prefix.isNull ? Container() : widget.prefix!.pr(32),
          Text(widget.label).fontSize(32).pr(32),
          Flexible(
            child: TextField(
              minLines: 1,
              maxLines: null,
              style: const TextStyle(
                fontSize: 32,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  color: Color(0xffb3b3b3),
                  fontSize: 32,
                ),
              ),
            ),
          ),
        ],
      ).px(32).py(25),
    );
  }
}
