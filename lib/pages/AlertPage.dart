import 'package:flutter/material.dart';
class AlertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alerts"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Mostrar alerta"),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: (){
            _showAlert(context);
          },
        ),
      ),
      floatingActionButton:   FloatingActionButton(
            child: Icon(Icons.arrow_back_ios),
            onPressed: (){
              Navigator.pop(context);
          },),
    );
  }

  _showAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius:  BorderRadius.circular(20)),
          title: Text("Titulo"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("Contenido de alerta"),
              FlutterLogo(size: 100.5,),
              Row(
                children: <Widget>[
                  RaisedButton(
                    child: Text("Ok"),
                    onPressed: (){},
                  )
                ],
              )
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(("Cancelar")),
              onPressed: ()=>Navigator.of(context).pop(),
            ),
             FlatButton(
              child: Text(("Ok")),
              onPressed: ()=>Navigator.of(context).pop(),
            )
          ],
        );
      }
    );
  }
}