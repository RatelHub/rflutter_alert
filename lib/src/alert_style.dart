/*
 * rflutter_alert
 * Created by Ratel
 * https://ratel.com.tr
 * 
 * Copyright (c) 2018 Ratel, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
import 'package:flutter/material.dart';

import 'constants.dart';

/// Alert style class for reusable customization of dialogs.
class AlertStyle {
  /// The [animationType] parameter is used for transitions. Default: "fromBottom"
  final AnimationType animationType;

  /// The [animationDuration] parameter is used to set the animation transition time. Default: "200 ms"
  final Duration animationDuration;

  /// The [alertBorder] parameter sets border.
  final ShapeBorder? alertBorder;

  /// The [isButtonVisible] paramater is used to decide hide or display buttons
  final bool isButtonVisible;

  /// The [isCloseButton] parameter sets visibility of the close button. Default: "true"
  final bool isCloseButton;

  /// The [isOverlayTapDismiss] parameter sets closing the alert by clicking outside. Default: "true"
  final bool isOverlayTapDismiss;

  /// The [backgroundColor] parameter sets the background color.
  final Color? backgroundColor;

  /// The [overlayColor] parameter sets the background color of the outside. Default: "Color(0xDD000000)"
  final Color overlayColor;

  /// The [titleStyle] parameter sets alert title text style.
  final TextStyle titleStyle;

  /// The [descStyle] parameter sets alert desc text style.
  final TextStyle descStyle;

  /// The [titleTextAlign] parameter sets alignment of the title.
  final TextAlign titleTextAlign;

  /// The [descTextAlign] parameter sets alignment of the desc.
  final TextAlign descTextAlign;

  /// The [buttonAreaPadding] parameter sets button area padding.
  final EdgeInsets buttonAreaPadding;

  /// The [constraints] parameter sets Alert size.
  final BoxConstraints? constraints;

  /// The [buttonsDirection] parameter sets button container as Row or Col.
  final ButtonsDirection buttonsDirection;

  /// The [alertElevation] parameter sets elevation of alert dialog container.
  final double? alertElevation;

  /// The [alertPadding] parameter sets alert area padding.
  final EdgeInsets alertPadding;

  /// The [alertAlignment] parameter sets alert dialog alignment.
  final AlignmentGeometry alertAlignment;

  /// The [isTitleSelectable] parameter sets title text is selectable or not.
  final bool isTitleSelectable;

  /// The [isDescSelectable] parameter sets desc text is selectable or not.
  final bool isDescSelectable;

  /// The [titlePadding] parameter sets title area padding.
  final EdgeInsets? titlePadding;

  /// The [descPadding] parameter sets desc area padding.
  final EdgeInsets descPadding;

  /// Alert style constructor function
  /// All properties are optional.
  const AlertStyle({
    this.animationType = AnimationType.fromBottom,
    this.animationDuration = const Duration(milliseconds: 200),
    this.alertBorder,
    this.isButtonVisible = true,
    this.isCloseButton = true,
    this.isOverlayTapDismiss = true,
    this.backgroundColor,
    this.overlayColor = Colors.black87,
    this.titleStyle = const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal),
    this.titleTextAlign = TextAlign.center,
    this.descStyle = const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal),
    this.descTextAlign = TextAlign.center,
    this.buttonAreaPadding = const EdgeInsets.all(20.0),
    this.constraints,
    this.buttonsDirection = ButtonsDirection.row,
    this.alertElevation,
    this.alertPadding = defaultAlertPadding,
    this.alertAlignment = Alignment.center,
    this.isTitleSelectable = false,
    this.isDescSelectable = false,
    this.titlePadding,
    this.descPadding = const EdgeInsets.all(0.0),
  });
}
