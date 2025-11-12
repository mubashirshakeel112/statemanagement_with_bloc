import 'package:bloc_example_03/Repository/login_repo.dart';
import 'package:bloc_example_03/presentation/login/bloc/login_bloc.dart';
import 'package:bloc_example_03/presentation/login/login_view.dart';
import 'package:bloc_example_03/presentation/splash/splash_view.dart';
import 'package:bloc_example_03/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(LoginRepository()),
      child: MaterialApp(
        initialRoute: SplashView.id,
        onGenerateRoute: RouteGenerator.generateRoutes,
        theme: ThemeData(scaffoldBackgroundColor: Colors.white.withValues(alpha: 0.975)),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
