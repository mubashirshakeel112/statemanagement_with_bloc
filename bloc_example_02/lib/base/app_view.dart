import 'package:bloc_example_02/presentation/home/bloc/capture_image_bloc.dart';
import 'package:bloc_example_02/presentation/home/home_view.dart';
import 'package:bloc_example_02/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CaptureImageBloc(),
      child: MaterialApp(
        initialRoute: HomeView.id,
        onGenerateRoute: RouteGenerator.generateRoutes,
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
