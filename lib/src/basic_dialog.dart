import 'package:flutter/material.dart';

import 'alert_style.dart';
import 'animation_transition.dart';
import 'dialog_button.dart';
import 'constants.dart';

class BasicDialog {
  final BuildContext context;
  final BasicDialogType type;
  final AlertStyle style;
  final Image image;
  final String title;
  final String desc;
  final List<DialogButton> buttons;

  BasicDialog({
    @required this.context,
    this.type,
    this.style = const AlertStyle(),
    this.image,
    @required this.title,
    @required this.desc,
    this.buttons,
  });

  void show() {
    showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return _buildDialog();
      },
      barrierDismissible: style.isOverlayTapDismiss,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: style.overlayColor,
      transitionDuration: style.animationDuration,
      transitionBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) =>
          _showAnimation(animation, secondaryAnimation, child),
    );
  }

  // void dismiss() {
  //   Navigator.pop(context);
  // }

  Widget _buildDialog() {
    return AlertDialog(
      shape: style.alertBorder ?? _defaultShape(),
      title: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  _getImage(),
                  style.isCloseButton
                      ? _getCloseButton()
                      : SizedBox(
                          height: 20,
                          width: 20,
                        ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                title,
                style: style.titleStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                desc,
                style: style.descStyle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      contentPadding: style.buttonAreaPadding,
      content: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _getButtons(),
        ),
      ),
    );
  }

  ShapeBorder _defaultShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      side: BorderSide(
        color: Colors.blueGrey,
      ),
    );
  }

  List<Widget> _getButtons() {
    List<Widget> expandedButtons = [];
    if (buttons != null) {
      buttons.forEach(
        (button) {
          var buttonWidget = Padding(
            padding: const EdgeInsets.only(left: 2, right: 2),
            child: button,
          );
          if (button.width != null && buttons.length == 1) {
            expandedButtons.add(buttonWidget);
          } else {
            expandedButtons.add(Expanded(
              child: buttonWidget,
            ));
          }
        },
      );
    } else {
      expandedButtons.add(
        Expanded(
          child: DialogButton(
            child: Text(
              "CANCEL",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      );
    }

    return expandedButtons;
  }

  Widget _getCloseButton() {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            '$kImagePath/close.png',
            package: 'rflutter_alert',
          ),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => Navigator.pop(context),
        ),
      ),
    );
  }

  Widget _getImage() {
    Widget response = image;
    switch (type) {
      case BasicDialogType.success:
        response = Image.asset(
          '$kImagePath/icon_success.png',
          package: 'rflutter_alert',
        );
        break;
      case BasicDialogType.error:
        response = Image.asset(
          '$kImagePath/icon_error.png',
          package: 'rflutter_alert',
        );
        break;
      case BasicDialogType.info:
        response = Image.asset(
          '$kImagePath/icon_info.png',
          package: 'rflutter_alert',
        );
        break;
      case BasicDialogType.warning:
        response = Image.asset(
          '$kImagePath/icon_warning.png',
          package: 'rflutter_alert',
        );
        break;
      case BasicDialogType.none:
        response = Container();
        break;
      default:
        response = Image.asset(
          '$kImagePath/icon_success.png',
          package: 'rflutter_alert',
        );
        break;
    }
    return response;
  }

  _showAnimation(animation, secondaryAnimation, child) {
    if (style.animationType == AnimationType.fromRight) {
      return AnimationTransition.fromRight(
          animation, secondaryAnimation, child);
    } else if (style.animationType == AnimationType.fromLeft) {
      return AnimationTransition.fromLeft(animation, secondaryAnimation, child);
    } else if (style.animationType == AnimationType.fromBottom) {
      return AnimationTransition.fromBottom(
          animation, secondaryAnimation, child);
    } else if (style.animationType == AnimationType.grow) {
      return AnimationTransition.grow(animation, secondaryAnimation, child);
    } else if (style.animationType == AnimationType.shrink) {
      return AnimationTransition.shrink(animation, secondaryAnimation, child);
    } else {
      return AnimationTransition.fromTop(animation, secondaryAnimation, child);
    }
  }
}
