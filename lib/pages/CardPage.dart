import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card"),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardOptionOne(),
          SizedBox(height: 30.0,),
          _cardOptionTwo(),
        ],
      ),
    );
  }

  Widget _cardOptionOne() {
    return Card(
      
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0)
      ),
      child: Column(
        children: <Widget>[
          ListTile(
              leading: Icon(Icons.photo_album),
              title: Text("Título"),
              subtitle: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed faucibus rutrum purus tincidunt porta. Proin est lectus, posuere ac ligula vel, aliquam cursus arcu. Vestibulum porttitor enim eu ligula facilisis lobortis ornare sed augue. Sed ullamcorper justo ac venenatis hendrerit. Integer et mauris turpis. Fusce consequat, nunc ut rhoncus sodales, dui eros lacinia lacus, nec auctor felis magna vitae leo. Morbi lobortis tempor orci sit amet auctor. Nam sed diam id felis suscipit tempor. Integer a neque fermentum quam semper porta. Aliquam eu sapien et ex gravida vestibulum. Suspendisse non dignissim risus. Suspendisse vulputate scelerisque turpis, vel tempus felis scelerisque in. Aliquam eget velit venenatis, lacinia lectus a, eleifend urna."),
            ),
          SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: (){},
              ),
              FlatButton(
                //textColor: Colors.white,
                //color: Colors.blue,
                child: Text("Ok"),
                onPressed: (){},
              )
            ],
          )
          
        ],
      ),
    );
  }

  Widget _cardOptionTwo() {
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,//Para adaptar la imagen al tamaño
            placeholder: AssetImage("assets/jar-loading.gif"),
            image: NetworkImage("http://travelmall.com.mx/wp-content/uploads/2017/06/PALACE-RESORTS-ANUNCIA-UNA-%E2%80%9CGRAND%E2%80%9D-TRANSFORMACI%C3%93N-1024x680.png")
          ),
          Container(
            //color: Colors.grey,
            padding: EdgeInsets.all(10.0),
            child: Text("Imagen landscape")
          )
        ],
      ),
    );
    return Container(
      //Si se desea decorar se usa decoration
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),//Borde del contenedor
        boxShadow: [//Se usa para darle sombras al container 
          BoxShadow(
            color: Colors.black26,//Color de la sombra
            blurRadius: 10.0,//Radio que se expandira
            spreadRadius: 2.0,//Grosor de la sombra
            //offset: Offset(2.0, 10.0)
          )
        ]
        //color: Colors.blue
      ),
      child: ClipRRect(
        //Para recortar la tarjeta es necesario usar ClipRRect
        child: card,
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}