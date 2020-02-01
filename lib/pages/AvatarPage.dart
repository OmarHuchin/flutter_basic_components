import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Avatars"),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://as01.epimg.net/meristation/imagenes/2019/08/25/noticias/1566717212_191664_1566717436_noticia_normal.jpg"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                child: Text("SL"),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
            )
          ],
        ),
        body: Center(
          child: FadeInImage(
              placeholder: AssetImage("assets/jar-loading.gif"),
              image: NetworkImage(
                  "https://eloutput.com/app/uploads-eloutput.com/2019/11/Spiderman-2022-800x419.jpg")),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ));
  }
}
