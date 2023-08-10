import 'package:flutter/material.dart';

extension TextWidgetExtension on Text {
  Text color(Color color) {
    var existedStyle = style ?? const TextStyle();
    return Text(
      data ?? "",
      style: existedStyle.copyWith(color: color),
    );
  }

  Text fontSize(double size) {
    var existedStyle = style ?? const TextStyle();
    return Text(
      data ?? "",
      style: existedStyle.copyWith(fontSize: size),
    );
  }

  Text underline() {
    var existedStyle = style ?? const TextStyle();
    return Text(
      data ?? "",
      style: existedStyle.copyWith(decoration: TextDecoration.underline),
    );
  }

  Text fontWeight(FontWeight fontWeight) {
    var existedStyle = style ?? const TextStyle();
    return Text(
      data ?? "",
      style: existedStyle.copyWith(fontWeight: fontWeight),
    );
  }
}
