import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "dart:io";

class RecipesScreen extends StatelessWidget {
  static final SCREEN = "RecipesScreen";

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map;
    final title = routeArgs["title"];
    return Platform.isAndroid
        ? Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: Center(
              child: Text("This your recipe"),
            ),
          )
        : CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text(title),
            ),
            child: SafeArea(
              child: Text("This your recipe"),
            ),
          );
  }
}
