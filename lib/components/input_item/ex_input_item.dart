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
          widget.prefix == null ? Container() : widget.prefix!.pr(16),
          Text(widget.label).fontSize(16).pr(16),
          Flexible(
            child: TextField(
              textAlign: TextAlign.start,
              minLines: 1,
              maxLines: null,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                isDense: true,
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  color: Color(0xffb3b3b3),
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ).px(16).py(13),
    );
  }
}
