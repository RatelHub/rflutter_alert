/*
 * rflutter_alert
 * Created by Ratel
 * https://ratel.com.tr
 * 
 * Copyright (c) 2018 Ratel, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/material.dart';

/// Alert types
enum AlertType { error, success, info, warning, none }

/// Alert animation types
enum AnimationType { fromRight, fromLeft, fromTop, fromBottom, grow, shrink }

/// Buttons container
enum ButtonsDirection { row, column }

/// Library images path
const String kImagePath = "assets/images";

typedef AlertAnimation = Widget Function(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child);
