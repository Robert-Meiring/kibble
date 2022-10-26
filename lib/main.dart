import 'package:flutter/material.dart';
import 'package:kibble/shared/factory/register_factory.dart';
import 'package:kibble/shared/navigation/route_generator.dart';

void main() {
  //call function to register dependencies
  RegisterFactory().setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kibble',
      //set custom font for MaterialApp
      theme: ThemeData(fontFamily: 'Monsterrat'),
      //set route generator for navigation
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: '/',
    );
  }
}
