import 'package:ex_widget/components/button/ex_button.dart';
import 'package:ex_widget/components/card/ex_card.dart';
import 'package:ex_widget/extensions/padding.extension.dart';
import 'package:ex_widget/extensions/text.extension.dart';
import 'package:flutter/material.dart';

class EXCTACard extends StatefulWidget {
  final String title;
  final String buttonText;
  const EXCTACard({
    super.key,
    required this.title,
    required this.buttonText,
  });

  @override
  State<EXCTACard> createState() => _EXCTACardState();
}

class _EXCTACardState extends State<EXCTACard> {
  @override
  Widget build(BuildContext context) {
    return EXCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(widget.title).fontSize(16).fontWeight(FontWeight.bold),
              ),
              EXButton(
                size: EXButtonSize.small,
                text: widget.buttonText,
                onPressed: () {},
              ).pl(30),
            ],
          ),
          Row(),
        ],
      ),
    );
  }
}
