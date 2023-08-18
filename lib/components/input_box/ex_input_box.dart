import 'package:ex_widget/extensions/padding.extension.dart';
import 'package:ex_widget/extensions/text.extension.dart';
import 'package:flutter/material.dart';

class EXInputBox extends StatefulWidget {
  final Widget? prefix;
  final String? label;
  final String? hintText;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final int? minLines;
  const EXInputBox({
    super.key,
    this.prefix,
    this.label,
    this.hintText,
    required this.controller,
    this.textInputAction = TextInputAction.done,
    this.textInputType = TextInputType.text,
    this.minLines = 1,
  });

  @override
  State<EXInputBox> createState() => _EXInputBoxState();
}

class _EXInputBoxState extends State<EXInputBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          widget.prefix != null ? widget.prefix!.pr(12) : Container(),
          widget.label == null ? Container() : Text(widget.label!).fontSize(16).color(Color(0xff3d3d3d)).fontWeight(FontWeight.w500).pr(12),
          Expanded(
            child: TextField(
              minLines: widget.minLines,
              maxLines: null,
              controller: widget.controller,
              textInputAction: widget.textInputAction,
              keyboardType: widget.textInputType,
              decoration: InputDecoration(
                border: InputBorder.none,
                isDense: true,
                contentPadding: const EdgeInsets.all(0),
                hintText: widget.hintText ?? "",
                hintStyle: const TextStyle(
                  color: Color(0xffb3b3b3),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
