import 'package:flutter/material.dart';
import 'popup_dialog_button.dart';
import 'constants.dart';

class BasicDialog {
  final BuildContext context;
  final BasicDialogType type;
  final Image image;
  final Text title;
  final Text desc;
  final ShapeBorder shape;
  final List<PopupDialogButton> buttons;

  BasicDialog({
    @required this.context,
    this.type,
    this.image,
    @required this.title,
    @required this.desc,
    this.shape,
    this.buttons,
  });

  show() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _buildDialog();
      },
    );
  }

  Widget _buildDialog() {
    return AlertDialog(
      shape: shape ?? _defaultShape(),
      title: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 96,
                height: 96,
                child: _getImage(),
              ),
              SizedBox(
                height: 15,
              ),
              title,
              SizedBox(
                height: 10,
              ),
              desc,
            ],
          ),
        ),
      ),
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
}
