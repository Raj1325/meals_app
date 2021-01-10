import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';

import 'package:meals_app/widget/meal_container.dart';

class FavoriteScreen extends StatefulWidget {
  final List<Meal> favMeal;
  FavoriteScreen(this.favMeal);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  void removeItem(String mealID) {
    return;
  }

  Widget getReciepieList(BuildContext context, List<Meal> meals) {
    return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(meals[index], removeItem);
        },
        itemCount: meals.length);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.favMeal.isEmpty) {
      return Center(
        child: Text("You dont have any fav meal yet !"),
      );
    } else {
      return getReciepieList(context, widget.favMeal);
    }
  }
}
