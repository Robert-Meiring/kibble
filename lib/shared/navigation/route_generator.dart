import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kibble/screens/home/home_screen.dart';
import 'package:kibble/screens/individual_pup_view/individual_pup_view.dart';
import 'package:kibble/shared/logic/dog/entities/individual_dog_entity.dart';

//this class is used for clean navigation, named routes
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) => const HomeScreen());
      case '/individualpupview':
        var data = settings.arguments as IndividualDogEntity;
        return CupertinoPageRoute(
            builder: (_) => IndividualPupView(
                  url: data.url,
                  index: data.index,
                ));

      default:
        return CupertinoPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
