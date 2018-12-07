import 'package:flutter/material.dart';

import 'alert_style.dart';
import 'animation_transition.dart';
import 'popup_dialog_button.dart';
import 'constants.dart';

class BasicDialog {
  final BuildContext context;
  final BasicDialogType type;
  final AlertStyle alertStyle;
  final Image image;
  final String title;
  final String desc;
  final List<PopupDialogButton> buttons;

  BasicDialog({
    @required this.context,
    this.type,
    this.alertStyle = const AlertStyle(),
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
      barrierDismissible: alertStyle.overlayTapDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: alertStyle.overlayColor,
      transitionDuration: const Duration(milliseconds: 200),
      transitionBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) =>
          _showAnimation(animation, secondaryAnimation, child),
    );
  }

  Widget _buildDialog() {
    return AlertDialog(
      shape: alertStyle.shapeBorder ?? _defaultShape(),
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
                  SizedBox(
                    width: 96,
                    height: 96,
                    child: _getImage(),
                  ),
                  alertStyle.showCloseButton
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
                style: alertStyle.titleStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                desc,
                style: alertStyle.descStyle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      contentPadding: alertStyle.buttonsPadding,
      content: Container(
        child: Row(
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
    buttons.forEach((button) {
      expandedButtons.add(
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 2, right: 2),
            child: button,
          ),
        ),
      );
    });
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

  Image _getImage() {
    Image response = image;
    switch (type) {
      case BasicDialogType.success:
        response = Image.asset(
          '$kImagePath/icon_success.png',
          package: 'rflutter_alert',
        );
        break;
      case BasicDialogType.error:
        response = Image.asset(
          '$kImagePath/icon_alert.png',
          package: 'rflutter_alert',
        );
        break;
      case BasicDialogType.info:
        response = Image.asset(
          '$kImagePath/icon_success.png',
          package: 'rflutter_alert',
        );
        break;
      case BasicDialogType.warning:
        response = Image.asset(
          '$kImagePath/icon_alert.png',
          package: 'popup_dialog',
        );
        break;
      default:
        response = Image.asset(
          '$kImagePath/icon_success.png',
          package: 'popup_dialog',
        );
        break;
    }
    return response;
  }

  _showAnimation(animation, secondaryAnimation, child) {
    if (alertStyle.animationType == AnimationType.fromRight) {
      return AnimationTransition.transitionFromRight(
          animation, secondaryAnimation, child);
    } else if (alertStyle.animationType == AnimationType.fromLeft) {
      return AnimationTransition.transitionFromLeft(
          animation, secondaryAnimation, child);
    } else if (alertStyle.animationType == AnimationType.fromBottom) {
      return AnimationTransition.transitionFromBottom(
          animation, secondaryAnimation, child);
    } else if (alertStyle.animationType == AnimationType.inToOut) {
      return AnimationTransition.transitionScaleInToOut(
          animation, secondaryAnimation, child);
    } else if (alertStyle.animationType == AnimationType.outToIn) {
      return AnimationTransition.transitionScaleOutToIn(
          animation, secondaryAnimation, child);
    } else {
      return AnimationTransition.transitionFromTop(
          animation, secondaryAnimation, child);
    }
  }
}
