import 'package:counter_app/presentation/home/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case HomeView.id:
        return MaterialPageRoute(builder: (_)=> HomeView());
      default:
        return _errorRoutes();
    }
  }

  static Route<dynamic> _errorRoutes(){
    return MaterialPageRoute(builder: (_)=> Scaffold(appBar: AppBar(title: Text('Error'),),));
  }
}