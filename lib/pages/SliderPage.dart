import 'dart:ffi';

import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _widthImagePercent = 350.0;
  bool _isBlocked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[_createSlider(),
            _createCheckbox(),
            _createImage()],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      min: 10,
      max: 400,
      value: _widthImagePercent,
      activeColor: Colors.indigo,
      label: "Tamaño de la imagen",
      //divisions: 10,
      onChanged: (value) {
        setState(() {
          if (_isBlocked) {
            _widthImagePercent = value;
          }
        });
      },
    );
  }

  Widget _createImage() {
    return FadeInImage(
      placeholder: AssetImage("assets/jar-loading.gif"),
      fit: BoxFit.contain,
      width: _widthImagePercent,
      image: NetworkImage(
        "https://images.wallpapersden.com/image/download/one-piece-minimalist_68314_1920x1080.jpg",
      ),
    );
    NetworkImage(
        "https://images.wallpapersden.com/image/download/one-piece-minimalist_68314_1920x1080.jpg");
  }

  Widget _createCheckbox() {
    return Checkbox(
      value: _isBlocked,
      onChanged: (newVal){
        setState(() {
          _isBlocked = newVal;
        });
      },
    );
  }
}
