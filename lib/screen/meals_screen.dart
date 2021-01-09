import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import "dart:io";

import 'package:meals_app/model/meal.dart';
import 'package:meals_app/widget/meal_container.dart';

class RecipesScreen extends StatelessWidget {
  static final SCREEN = "RecipesScreen";

  Widget getReciepieList(
      BuildContext context, String title, String id, List<Meal> meals) {
    return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(meals[index]);
        },
        itemCount: meals.length);
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map;
    final title = routeArgs["title"];
    final id = routeArgs["id"];
    final List<Meal> meals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(id);
    }).toList();
    return Platform.isAndroid
        ? Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: getReciepieList(context, title, id, meals),
          )
        : CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text(title),
            ),
            child: SafeArea(
              child:
                  Material(child: getReciepieList(context, title, id, meals)),
            ),
          );
  }
}
