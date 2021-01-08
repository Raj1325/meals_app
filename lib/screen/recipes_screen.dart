import 'package:flutter/material.dart';

class RecipesScreen extends StatelessWidget {
  static final SCREEN = "RecipesScreen";

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map;
    final title = routeArgs["title"];
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text("This your recipe"),
      ),
    );
  }
}
