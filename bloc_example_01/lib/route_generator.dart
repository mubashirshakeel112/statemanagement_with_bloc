import 'package:bloc_example_01/presentation/home/home_view.dart';
import 'package:bloc_example_01/presentation/products_detail/products_detail_view.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case HomeView.id:
        return MaterialPageRoute(builder: (_) => HomeView());
      case ProductsDetailView.id:
        final args = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => ProductsDetailView(productId: args,));
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
