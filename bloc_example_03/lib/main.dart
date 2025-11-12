import 'package:bloc_example_03/base/app_view.dart';
import 'package:bloc_example_03/services/preferences.dart';
import 'package:flutter/cupertino.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Preference.init();
  runApp(AppView());
}