import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final Color color;
  final Gradient gradient;
  final BorderRadius radius;
  final Function onPressed;

  DialogButton({
    Key key,
    @required this.child,
    this.width,
    this.height = 40.0,
    this.color,
    this.gradient,
    this.radius,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).accentColor,
        gradient: gradient,
        borderRadius: radius ?? BorderRadius.circular(6),
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
