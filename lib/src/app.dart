import 'package:flutter/material.dart';

import './screens/not_found.dart';
import './screens/main_page.dart';

import './blocs/generations/generations_provider.dart';
import './screens/generations.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return MaterialApp(
      title: 'PokeHub',
      onGenerateRoute: _routes,
    );
  }

  Route _routes(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (BuildContext context) {
        return MainPage();
      });
    }

    if (settings.name == '/generations') {
      return MaterialPageRoute(builder: (BuildContext context) {
        return GenerationsProvider(
          child: GenerationsScreen(),
        );
      });
    }

    return MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Oops!!'),
        ),
        body: NotFoundScreen(),
      );
    });
  }
}
