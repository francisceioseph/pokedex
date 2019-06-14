import 'package:flutter/material.dart';
import './screens/not_found.dart';
import './screens/main_page.dart';

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
