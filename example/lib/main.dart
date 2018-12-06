import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(RatelApp());

class RatelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Popup Dialog Example'),
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
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Basic Alert Dialog'),
              onPressed: () => _onBasicAlertDialogPressed(context),
            )
          ],
        ),
      ),
    );
  }

  _onBasicAlertDialogPressed(context) {
    return BasicDialog(
      context: context,
      title: Text("POPUP TİTLE"),
      desc: Text("This area popup desc. Long text is here", textAlign: TextAlign.center,),
      type: BasicDialogType.error,
      buttons: [
        PopupDialogButton(
          child: Text("Tıkla Baham"),
          onPressed: () {},
        ),
        PopupDialogButton(
          child: Icon(Icons.perm_camera_mic),
          onPressed: () {},
          gradient: LinearGradient(
            colors: [Colors.red, Colors.black]
          ),
        ),
      ],
    ).show();
  }
}
