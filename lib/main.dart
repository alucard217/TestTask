import 'package:flutter/material.dart';

import 'Navigation/RouteParser.dart';
import 'Navigation/RouterDelegate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final delegate = MyRouterDelegate();
  final parser = MyRouteParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: delegate,
      routeInformationParser: parser,
    );
  }

}