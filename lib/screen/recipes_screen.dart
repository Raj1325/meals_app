import 'package:flutter/material.dart';
import 'package:meals_app/widget/adaptive_app.dart';

class RecipesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipe"),
      ),
      body: Center(
        child: Text("This your recipe"),
      ),
    );
  }
}
