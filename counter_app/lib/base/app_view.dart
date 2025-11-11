import 'package:counter_app/presentation/home/bloc/counter_bloc.dart';
import 'package:counter_app/presentation/home/home_view.dart';
import 'package:counter_app/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        initialRoute: HomeView.id,
        onGenerateRoute: RouteGenerator.generateRoute,
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
