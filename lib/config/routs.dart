import 'package:flutter/material.dart';
import 'package:travel_flutter/pages/main_page.dart';

class Routes{
static Map<String, WidgetBuilder> getRoutes(){
  return <String, WidgetBuilder>{
    '/': (_) => MainPage();
  };
}
}