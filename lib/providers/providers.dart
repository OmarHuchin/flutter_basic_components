
import 'dart:convert';
import 'package:flutter/services.dart';

class Provider{
  Future<List<dynamic>> loadData(){
    return rootBundle.loadString("data/menu_opts.json").then(
      (string){
        Map list = json.decode(string);
        print(list);
        return list["rutas"];
      }
    );
  }
}