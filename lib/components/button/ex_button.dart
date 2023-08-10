import 'dart:js_interop';

import 'package:ex_widget/extensions/text.extension.dart';
import 'package:flutter/material.dart';

class EXButton extends StatefulWidget {
  final String? text;
  final Widget? child;
  const EXButton({
    this.text,
    super.key,
    this.child,
  });

  @override
  State<EXButton> createState() => _EXButtonState();
}

class _EXButtonState extends State<EXButton> {
  renderContent() {
    if (widget.text.isDefinedAndNotNull) {
      return Text(widget.text!).fontSize(32).fontWeight(FontWeight.w600);
    }
    return widget.child;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        minimumSize: MaterialStateProperty.all(const Size(double.infinity, 100)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      onPressed: () {},
      child: renderContent(),
    );
  }
}
