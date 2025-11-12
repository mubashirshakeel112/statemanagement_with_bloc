import 'package:bloc_example_03/presentation/home/home_view.dart';
import 'package:bloc_example_03/presentation/login/login_view.dart';
import 'package:bloc_example_03/presentation/splash/splash_view.dart';
import 'package:flutter/material.dart';

class RouteGenerator{
  static Route<dynamic> generateRoutes(RouteSettings settings){
    switch(settings.name){
      case LoginView.id:
        return MaterialPageRoute(builder: (_)=> LoginView());
      case HomeView.id:
        return MaterialPageRoute(builder: (_)=> HomeView());
        case SplashView.id:
        return MaterialPageRoute(builder: (_)=> SplashView());
      default:
        return _errorRoutes();

    }
  }

  static Route<dynamic> _errorRoutes(){
    return MaterialPageRoute(builder: (_)=> Scaffold(appBar: AppBar(title: Text('Error'),),));
  }
}