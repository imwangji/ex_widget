import 'package:ex_widget/components/divider/ex_divider.dart';
import 'package:ex_widget/extensions/padding.extension.dart';
import 'package:ex_widget/extensions/text.extension.dart';
import 'package:flutter/material.dart';
import '../card/ex_card.dart';

class SimpleCard extends StatefulWidget {
  final String title;
  final Widget? action;
  final Widget? footer;
  final VoidCallback onTap;
  const SimpleCard({
    super.key,
    required this.title,
    this.action,
    this.footer,
    required this.onTap,
  });

  @override
  State<SimpleCard> createState() => _SimpleCardState();
}

class _SimpleCardState extends State<SimpleCard> {
  @override
  Widget build(BuildContext context) {
    return EXCard(
      onTap: widget.onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(widget.title).fontSize(16).fontWeight(FontWeight.bold),
              ),
              widget.action == null ? Container() : widget.action!.pl(30),
            ],
          ),
          widget.footer == null
              ? Container()
              : const EXDivider(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                ),
          widget.footer != null
              ? ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 48),
                  child: widget.footer,
                )
              : Container(),
        ],
      ),
    );
  }
}
