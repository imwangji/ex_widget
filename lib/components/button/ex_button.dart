import 'dart:js_interop';

import 'package:ex_widget/extensions/text.extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum EXButtonSize {
  large,
  normal,
  small,
  mini,
}

enum EXButtonType {
  fill,
  stroke,
  fillAndStroke,
  text,
}

enum EXButtonState {
  nomal,
  pressed,
  disabled,
}

class EXButton extends StatefulWidget {
  final String? text;
  final Widget? child;
  final EXButtonSize? exButtonSize;
  final EXButtonType? exButtonType;
  final EXButtonState? exButtonState;
  final bool? isLoading;
  final bool? isBlock;
  final IconData? prefixIcon;
  final VoidCallback onPressed;
  const EXButton({
    this.text,
    super.key,
    this.child,
    this.exButtonSize = EXButtonSize.normal,
    this.exButtonState = EXButtonState.nomal,
    this.exButtonType = EXButtonType.fill,
    this.isBlock = true,
    this.isLoading = false,
    this.prefixIcon,
    required this.onPressed,
  });

  @override
  State<EXButton> createState() => _EXButtonState();
}

class _EXButtonState extends State<EXButton> {
  getFontSizeByEXButtonSize() {
    switch (widget.exButtonSize) {
      case EXButtonSize.large:
        return 32;
      case EXButtonSize.normal:
        return 32;
      case EXButtonSize.small:
        return 28;
      case EXButtonSize.mini:
        return 24;
      default:
        return 32;
    }
  }

  getPaddingByEXButtonSize() {
    switch (widget.exButtonSize) {
      case EXButtonSize.large:
        return 90;
      case EXButtonSize.normal:
        return 90;
      case EXButtonSize.small:
        return 60;
      case EXButtonSize.mini:
        return 30;
      default:
        return 90;
    }
  }

  getBackgroundByEXButtonType() {
    switch (widget.exButtonType) {
      case EXButtonType.fill:
        return Theme.of(context).primaryColor;
      case EXButtonType.stroke:
        return Colors.white;
      case EXButtonType.fillAndStroke:
        return Theme.of(context).primaryColor.withOpacity(.5);
      case EXButtonType.text:
        return Colors.transparent;
      default:
        return Theme.of(context).primaryColor;
    }
  }

  getBorderSideByEXButtonType() {
    switch (widget.exButtonType) {
      case EXButtonType.fill:
        return BorderSide.none;
      case EXButtonType.stroke:
        return BorderSide(color: Theme.of(context).primaryColor.withOpacity(.6));
      case EXButtonType.fillAndStroke:
        return BorderSide(color: Theme.of(context).primaryColor.withOpacity(.6));
      case EXButtonType.text:
        return BorderSide.none;
      default:
        return BorderSide.none;
    }
  }

  getLoadingIndicator() {
    if (widget.exButtonType == EXButtonType.fill) {
      return const CupertinoActivityIndicator(
        color: Colors.white,
      );
    } else {
      return CupertinoActivityIndicator(
        color: Theme.of(context).primaryColor,
      );
    }
  }

  getSizeByPropsEXButtonSize() {
    if (widget.isBlock!) {
      return MaterialStateProperty.all(const Size(double.infinity, 100));
    } else {
      switch (widget.exButtonSize) {
        case EXButtonSize.large:
          return MaterialStateProperty.all(const Size.fromHeight(100));
        case EXButtonSize.normal:
          return MaterialStateProperty.all(const Size.fromHeight(100));
        case EXButtonSize.small:
          return MaterialStateProperty.all(const Size.fromHeight(80));
        case EXButtonSize.mini:
          return MaterialStateProperty.all(const Size.fromHeight(56));
        default:
          return MaterialStateProperty.all(const Size.fromHeight(100));
      }
    }
  }

  renderContent() {
    if (widget.isLoading!) {
      return getLoadingIndicator();
    }
    if (widget.text.isDefinedAndNotNull) {
      return Text(widget.text!).fontSize(getFontSizeByEXButtonSize()).fontWeight(FontWeight.w600);
    }
    return widget.child;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        minimumSize: getSizeByPropsEXButtonSize(),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: getBorderSideByEXButtonType(),
          ),
        ),
      ),
      onPressed: () {},
      child: renderContent(),
    );
  }
}
