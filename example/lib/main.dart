import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(RatelApp());

class RatelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('RFlutter Alert by Ratel'),
        ),
        body: PopupDialog(),
      ),
    );
  }
}

class PopupDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Basic Alert'),
              onPressed: () => _onBasicAlertPressed(context),
            ),
            RaisedButton(
              child: Text('Alert with Button'),
              onPressed: () => _onAlertButtonPressed(context),
            ),
            RaisedButton(
              child: Text('Alert with Buttons'),
              onPressed: () => _onAlertButtonsPressed(context),
            ),
            RaisedButton(
              child: Text('Alert with Style'),
              onPressed: () => _onAlertWithStylePressed(context),
            )
          ],
        ),
      ),
    );
  }

  _onBasicAlertPressed(context) {
    BasicDialog(
            context: context,
            title: "RFLUTTER ALERT",
            desc: "Flutter is more awesome with RFlutter Alert.")
        .show();
  }

  _onAlertButtonPressed(context) {
    BasicDialog(
      context: context,
      type: BasicDialogType.error,
      title: "RFLUTTER ALERT",
      desc: "Flutter is more awesome with RFlutter Alert.",
      buttons: [
        DialogButton(
          child: Text(
            "COOL",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }

  _onAlertButtonsPressed(context) {
    BasicDialog(
      context: context,
      type: BasicDialogType.warning,
      title: "RFLUTTER ALERT",
      desc: "Flutter is more awesome with RFlutter Alert.",
      buttons: [
        DialogButton(
          child: Text(
            "FLAT",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: Text(
            "GRADIENT",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
        )
      ],
    ).show();
  }

  _onAlertWithStylePressed(context) {
    var alertStyle = AlertStyle(
      animationType: AnimationType.fromTop,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: TextStyle(fontWeight: FontWeight.bold),
      animationDuration: Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: TextStyle(
        color: Colors.red,
      ),
    );

    BasicDialog(
      context: context,
      style: alertStyle,
      type: BasicDialogType.info,
      title: "RFLUTTER ALERT",
      desc: "Flutter is more awesome with RFlutter Alert.",
      buttons: [
        DialogButton(
          child: Text(
            "FLAT",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: Text(
            "GRADIENT",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
        )
      ],
    ).show();
  }

  _onBasicAlertDialogPressed(context) {
    var alertStyle = AlertStyle(
        animationType: AnimationType.fromRight,
        isCloseButton: true,
        isOverlayTapDismiss: false,
        titleStyle: TextStyle(color: Colors.red));
    var alertDialog = BasicDialog(
        context: context,
        style: alertStyle,
        title: "POPUP TİTLE",
        desc: "This area popup desc. Long text is here",
        type: BasicDialogType.error,
        buttons: [
          DialogButton(
            child: Text(
              "Cancel",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            height: 50,
            color: Colors.blueGrey,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          DialogButton(
            child: Text(
              "Cancel",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            height: 50,
            color: Colors.blueGrey,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ]);
    alertDialog.show();
  }
}
