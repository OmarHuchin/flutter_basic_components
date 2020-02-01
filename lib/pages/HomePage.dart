import 'package:flutter/material.dart';
import 'package:flutter_components/providers/providers.dart';
import 'package:flutter_components/utils/icon_utils.dart';
class HomePage extends StatelessWidget {
  final providers = Provider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Components"),
      ),
      body: _getList(),
    );
  }

  Widget _getList() {
    return FutureBuilder(
      future: providers.loadData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
        List<dynamic> options = snapshot.data;
        return ListView(
          children: _getOptions(context,options),
        );
      },
    );
  }

  List<Widget> _getOptions(BuildContext context,List<dynamic> options){
    final List<Widget> widgets = [];
    options.forEach((option){
      widgets..add(
        ListTile(
          leading: getIcon(option["icon"]),
          title: Text(option["texto"]),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: (){
            Navigator.pushNamed(context, option["ruta"]);
          },
        )
      )
      ..add(
        Divider()
      );
    });
    return widgets;
  }
}