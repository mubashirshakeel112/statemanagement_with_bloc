import 'package:bloc_example_02/presentation/home/home_view.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case HomeView.id:
        return MaterialPageRoute(builder: (_)=> HomeView());
      default:
        return _errorRoutes();
    }
  }

  static Route<dynamic> _errorRoutes() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(appBar: AppBar(title: Text('Error'))),
    );
  }
}
