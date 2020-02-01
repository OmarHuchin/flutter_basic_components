import 'package:flutter/material.dart';

final _icons = <String,IconData> {
    'accessibility' : Icons.accessibility,
    'add_alert'     : Icons.add_alert,
    'folder_open'   : Icons.folder_open,
    'donut_large'   : Icons.donut_large,
    'inputs'        : Icons.input,
    'sliders'       : Icons.crop_original,
    'lists'         : Icons.format_list_numbered
};

Icon getIcon(String name){
  return Icon(
    _icons[name],
    color: Colors.blue,
  );
}