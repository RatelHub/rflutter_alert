import 'package:flutter/material.dart';
import 'constants.dart';

class AlertStyle {
  final AnimationType animationType;
  final ShapeBorder shapeBorder;
  final bool showCloseButton;
  final bool overlayTapDismissible;
  final Color overlayColor;
  final TextStyle titleStyle;
  final TextStyle descStyle;
  final EdgeInsets buttonsPadding;

  const AlertStyle({
    this.animationType = AnimationType.fromBottom,
    this.shapeBorder,
    this.showCloseButton = false,
    this.overlayTapDismissible = true,
    this.overlayColor = Colors.black87,
    this.titleStyle = const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontSize: 22.0),
    this.descStyle = const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 18.0),
    this.buttonsPadding = const EdgeInsets.all(15.0),
  });
}
