import 'package:ex_widget/components/button/ex_button.dart';
import 'package:ex_widget/extensions/padding.extension.dart';
import 'package:ex_widget/extensions/text.extension.dart';
import 'package:flutter/material.dart';

class EXSectionHeader extends StatefulWidget {
  final String? title;
  final Widget? action;
  final Widget? prefix;
  final EXSize? size;
  final Color? backgroundColor;
  const EXSectionHeader({
    super.key,
    this.title,
    this.action,
    this.prefix,
    this.size = EXSize.normal,
    this.backgroundColor = Colors.transparent,
  });

  @override
  State<EXSectionHeader> createState() => _EXSectionHeaderState();
}

class _EXSectionHeaderState extends State<EXSectionHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: widget.backgroundColor,
      child: Row(
        children: [
          widget.prefix ?? Container(),
          Expanded(
            child: widget.title != null ? Text(widget.title!).fontSize(18).fontWeight(FontWeight.bold) : Container(),
          ),
          widget.action != null ? widget.action!.pl(16) : Container(),
        ],
      ),
    );
  }
}
