import 'package:ex_widget/extensions/text.extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum EXSize {
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
  final EXSize? size;
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
    this.size = EXSize.normal,
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
    switch (widget.size) {
      case EXSize.large:
        return 16.0;
      case EXSize.normal:
        return 16.0;
      case EXSize.small:
        return 14.0;
      case EXSize.mini:
        return 12.0;
      default:
        return 16.0;
    }
  }

  getPaddingByEXButtonSize() {
    switch (widget.size) {
      case EXSize.large:
        return 45.0;
      case EXSize.normal:
        return 45.0;
      case EXSize.small:
        return 45.0;
      case EXSize.mini:
        return 45.0;
      default:
        return 45.0;
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
      return MaterialStateProperty.all(const Size(double.infinity, 50));
    } else {
      switch (widget.size) {
        case EXSize.large:
          return MaterialStateProperty.all(const Size.fromHeight(50));
        case EXSize.normal:
          return MaterialStateProperty.all(const Size.fromHeight(50));
        case EXSize.small:
          return MaterialStateProperty.all(const Size.fromHeight(40));
        case EXSize.mini:
          return MaterialStateProperty.all(const Size.fromHeight(28));
        default:
          return MaterialStateProperty.all(const Size.fromHeight(50));
      }
    }
  }

  renderContent() {
    if (widget.isLoading!) {
      return getLoadingIndicator();
    }
    if (widget.text != null) {
      return Text(widget.text!).fontSize(getFontSizeByEXButtonSize()).fontWeight(FontWeight.w600);
    }
    return widget.child;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: getBorderSideByEXButtonType(),
          ),
        ),
      ),
      onPressed: () {},
      child: renderContent(),
    );
  }
}
