import 'package:flutter/cupertino.dart';
import 'package:test_task/Navigation/RouterDelegate.dart';

class MyRouteParser extends RouteInformationParser<AppPage>{

  @override
  Future<AppPage> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = routeInformation.uri;
    if (uri.pathSegments.isNotEmpty && uri.pathSegments.first == 'result'){
      return AppPage.result;
    }
    return AppPage.prompt;
  }

  @override
  RouteInformation? restoreRouteInformation(AppPage configuration) {
    switch (configuration){
      case AppPage.result:
        return RouteInformation(uri: Uri.parse('/result'));
      case AppPage.prompt:
      return RouteInformation(uri: Uri.parse('/'));
    }
  }

}