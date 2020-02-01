import 'package:flutter/material.dart';
import 'package:flutter_components/pages/AlertPage.dart';
import 'package:flutter_components/pages/AnimatedContainer.dart';
import 'package:flutter_components/pages/AvatarPage.dart';
import 'package:flutter_components/pages/CardPage.dart';
import 'package:flutter_components/pages/HomePage.dart';
import 'package:flutter_components/pages/InputPage.dart';
import 'package:flutter_components/pages/SliderPage.dart';
import 'package:flutter_components/pages/list_builder_page.dart';

final _routes = <String,WidgetBuilder> {
      '/': (BuildContext context) => HomePage(),
      'alert': (BuildContext context)=> AlertPage(),
      'avatar': (BuildContext context)=> AvatarPage(),
      'card': (BuildContext context)=> CardPage(),
      "animatedContainer": (BuildContext context)=> AnimatedContainerPage(),
      'inputs': (BuildContext context)=> InputPage(),
      'sliders': (BuildContext context)=> SliderPage(),
      'lists': (BuildContext context)=> ListBuilderPage()
};
 Map<String,WidgetBuilder> getApplicationsRouets() => _routes;