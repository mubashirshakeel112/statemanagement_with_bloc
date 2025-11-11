import 'package:bloc_example_01/presentation/home/bloc/products_bloc.dart';
import 'package:bloc_example_01/presentation/home/home_view.dart';
import 'package:bloc_example_01/presentation/products_detail/bloc/products_detail_bloc.dart';
import 'package:bloc_example_01/repository/products_repo.dart';
import 'package:bloc_example_01/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=> ProductsBloc(ProductsRepository())),
        BlocProvider(create: (_)=> ProductsDetailBloc(ProductsRepository()))
      ],
      child: MaterialApp(
        initialRoute: HomeView.id,
        onGenerateRoute: RouteGenerator.generateRoutes,
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
