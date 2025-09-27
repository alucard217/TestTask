import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_task/PromptPage.dart';
import 'package:test_task/ResultPage.dart';

enum AppPage { prompt, result }

class MyRouterDelegate extends RouterDelegate<AppPage>
with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppPage> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  AppPage _currentPage = AppPage.prompt;

  @override
  AppPage? get currentConfiguration => _currentPage;

  void goToResults(){
    _currentPage = AppPage.result;
    notifyListeners();
  }
  void goToHome(){
    _currentPage = AppPage.prompt;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(child: PromptPage(generateButtonPressed: goToResults)),
        if (_currentPage == AppPage.result)
          MaterialPage(child: ResultPage(newPromptButtonPressed: goToHome)),
      ],
      onDidRemovePage: (page){
        if (page is MaterialPage && page.child is ResultPage) {
          _currentPage = AppPage.prompt;
          notifyListeners();
        }
      } ,
    );
  }

  @override
  Future<void> setNewRoutePath(AppPage configuration) async {
    _currentPage = configuration;
  }
}
