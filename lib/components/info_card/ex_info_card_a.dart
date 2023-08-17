import 'package:ex_widget/components/card/ex_card.dart';
import 'package:ex_widget/extensions/padding.extension.dart';
import 'package:ex_widget/extensions/text.extension.dart';
import 'package:flutter/material.dart';

class EXInfoCardAItem {
  final String label;
  final String value;
  EXInfoCardAItem({
    required this.label,
    required this.value,
  });
}

class EXInfoCardA extends StatefulWidget {
  final List<EXInfoCardAItem> items;

  const EXInfoCardA({
    super.key,
    required this.items,
  });

  @override
  State<EXInfoCardA> createState() => _EXInfoCardAState();
}

class _EXInfoCardAState extends State<EXInfoCardA> {
  @override
  Widget build(BuildContext context) {
    return EXCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.items
            .map(
              (e) => Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(e.value).fontSize(18).fontWeight(FontWeight.w600).color(Colors.black.withOpacity(1)).pb(3),
                  Text(e.label).fontSize(12).color(Colors.black.withOpacity(.4)),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
