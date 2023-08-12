import 'package:ex_widget/extensions/padding.extension.dart';
import 'package:ex_widget/extensions/text.extension.dart';
import 'package:flutter/material.dart';

class EXInputItem extends StatefulWidget {
  final String label;
  final String? hintText;
  const EXInputItem({super.key, required this.label, this.hintText});

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
        children: [
          Text(widget.label).fontSize(32).pr(32),
          Flexible(
            child: TextField(
              style: TextStyle(
                fontSize: 32,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: TextStyle(
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
