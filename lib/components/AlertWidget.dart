import 'package:flutter/material.dart';

class AlertWidget extends AlertDialog {
  String mtitle = "";
  String mmessage = "";
  BuildContext context;
  AlertWidget(String title, String message){
    this.mtitle = title;
    this.mmessage = message;
  }
  @override
  // TODO: implement title
  Widget get title => Text(mtitle);
  @override
  Widget get content => Text(mmessage);
  @override
  List<Widget> get actions => [
    Row(
      children: <Widget>[
        FlatButton(
          child: Text("Cancelar"),
          onPressed: ()=> Navigator.of(context),
        )
      ],
    )
  ];
}