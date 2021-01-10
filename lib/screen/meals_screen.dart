import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "dart:io";

import 'package:meals_app/model/meal.dart';
import 'package:meals_app/widget/meal_container.dart';

class RecipesScreen extends StatefulWidget {
  static final SCREEN = "RecipesScreen";
  final List<Meal> availableMeals;
  final Function isFavMeal;

  RecipesScreen(this.availableMeals, this.isFavMeal);

  @override
  _RecipesScreenState createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  String title;
  String id;
  List<Meal> meals;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    var routeArgs = ModalRoute.of(context).settings.arguments as Map;
    this.title = routeArgs["title"];
    this.id = routeArgs["id"];
    this.meals = widget.availableMeals.where((meal) {
      return meal.categories.contains(id);
    }).toList();
    super.didChangeDependencies();
  }

  void removeItem(String mealID) {
    setState(() {
      meals.removeWhere((element) => (element.id == mealID));
    });
  }

  Widget getReciepieList(
      BuildContext context, String title, String id, List<Meal> meals) {
    return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(meals[index], removeItem);
        },
        itemCount: meals.length);
  }

  @override
  Widget build(BuildContext context) {
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
