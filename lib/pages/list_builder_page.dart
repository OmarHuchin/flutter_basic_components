import 'dart:async';

import 'package:flutter/material.dart';

class ListBuilderPage extends StatefulWidget {
  ListBuilderPage({Key key}) : super(key: key);

  @override
  _ListBuilderPageState createState() => _ListBuilderPageState();
}

class _ListBuilderPageState extends State<ListBuilderPage> {
  bool _isLoading = false;
  int _lastItem = 0;
  List<int> _itemList = List();
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _createImages();
    _scrollController.addListener((){
        if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
          _fetchData();
        }
        print(_scrollController.offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista"),
      ),
      body: Stack(
        children: <Widget>[
          _createBody(),
          _createLoading(),
        ],
      ),
    );
  }

  Widget _createBody() {
    return ListView.builder(
        controller: _scrollController,
        itemCount: _itemList.length,
        itemBuilder: (builder, i){
          return FadeInImage(
            image: NetworkImage("https://i.picsum.photos/id/${i + 10}/1024/980.jpg"),
            placeholder: AssetImage("assets/jar-loading.gif"),
          );
        }
    );
  }
  Widget _createImages(){
    List<Widget> widgets = List();
    for(var i = 1; i < 10; i++){
      _lastItem ++;
      _itemList.add(_lastItem);
    }
    setState(() {
      
    });
  }

  Future _fetchData() async{
      _isLoading = true;
      setState(() {});
      return Timer(Duration(seconds: 2),_httpRequest);
  }
  void _httpRequest(){
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration:  Duration(milliseconds: 250)
    );
    _createImages();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  Widget _createLoading() {
    if(_isLoading){
      return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator()
              ],
            ),
            SizedBox(height: 15,)
          ],
        );
    }else{
        return Container();
    }
  }
}