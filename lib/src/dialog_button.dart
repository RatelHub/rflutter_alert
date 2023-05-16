/*
 * rflutter_alert
 * Created by Ratel
 * https://ratel.com.tr
 * 
 * Copyright (c) 2018 Ratel, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
import 'package:flutter/material.dart';

/// Used for defining alert buttons.
///
/// [child] and [onPressed] parameters are required.
class DialogButton extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double height;
  final Color? color;
  final Color? highlightColor;
  final Color? splashColor;
  final Gradient? gradient;
  final BorderRadius radius;
  final VoidCallback? onPressed;
  final BoxBorder border;
  final EdgeInsets padding;
  final EdgeInsets margin;

  /// DialogButton constructor
  DialogButton({
    Key? key,
    required this.child,
    this.width,
    this.height = 40.0,
    this.color,
    this.highlightColor,
    this.splashColor,
    this.gradient,
    this.radius = const BorderRadius.all(Radius.circular(6)),
    this.border = const Border.fromBorderSide(
      BorderSide(
        color: const Color(0x00000000),
        width: 0,
        style: BorderStyle.solid,
      ),
    ),
    this.padding = const EdgeInsets.only(left: 6, right: 6),
    this.margin = const EdgeInsets.all(6),
    required this.onPressed,
  }) : super(key: key);

  /// Creates alert buttons based on constructor params
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.secondary,
        gradient: gradient,
        borderRadius: radius,
        border: border,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: highlightColor ?? Theme.of(context).highlightColor,
          splashColor: splashColor ?? Theme.of(context).splashColor,
          onTap: onPressed,
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
