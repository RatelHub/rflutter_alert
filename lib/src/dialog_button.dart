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
    final Widget child;
    final double width;
    final double height;
    final Color color;
    final Gradient gradient;
    final BorderRadius radius;
    final Function onPressed;
    final BoxBorder border;
    final EdgeInsets padding;

    /// DialogButton constructor
    DialogButton({
        Key key,
        @required this.child,
        this.width,
        this.height = 40.0,
        this.color,
        this.gradient,
        this.radius,
        this.border,
        this.padding = const EdgeInsets.only(left: 6, right: 6),
        @required this.onPressed,
    }) : super(key: key);

    /// Creates alert buttons based on constructor params
    @override
    Widget build(BuildContext context) {
        return Container(
            padding: padding,
            width: width,
            height: height,
            decoration: BoxDecoration(
                color: color ?? Theme
                    .of(context)
                    .accentColor,
                gradient: gradient,
                borderRadius: radius ?? BorderRadius.circular(6),
                border: border ?? Border.all(color: Colors.transparent, width: 0)
            ),
            child: Material(
                color: Colors.transparent,
                child: InkWell(
                    onTap: onPressed,
                    child: Center(
                        child: child,
                    ),
                ),
            ),
        );
    }
}
