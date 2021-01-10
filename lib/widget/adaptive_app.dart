import "dart:io";
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screen/filter_screen.dart';
import 'package:meals_app/screen/meals_screen.dart';
import 'package:meals_app/screen/reciepes_screen.dart';
import 'package:meals_app/screen/tabs_screen.dart';

class AdaptiveApp extends StatefulWidget {
  final String title;
  final Widget homeScreen;

  const AdaptiveApp(this.title, this.homeScreen);

  @override
  _AdaptiveAppState createState() => _AdaptiveAppState();
}

class _AdaptiveAppState extends State<AdaptiveApp> {
  Map<String, bool> filters = {
    "vegetarian": false,
    "vegan": false,
    "lactosefree": false,
    "glutenfree": false,
  };

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favouriteMeal = [];

  void toggleFv(String mealID) {
    final index = favouriteMeal.indexWhere((meal) {
      return mealID == meal.id;
    });
    if (index >= 0) {
      setState(() {
        favouriteMeal.removeAt(index);
      });
    } else {
      setState(() {
        favouriteMeal
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealID));
      });
    }
  }

  bool isMealFav(String id) {
    bool val = this.favouriteMeal.any((element) => element.id == id);
    print(val);
    return val;
  }

  void applyFilters(Map<String, bool> filters) {
    setState(() {
      this.filters = filters;

      availableMeals = DUMMY_MEALS.where((meal) {
        if (filters["vegetarian"] && !meal.isVegetarian) {
          return false;
        } else if (filters["vegan"] && !meal.isVegan) {
          return false;
        } else if (filters["lactosefree"] && !meal.isLactoseFree) {
          return false;
        } else if (filters["glutenfree"] && !meal.isGlutenFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  StatefulWidget getApp(Widget scaffold) {
    return MaterialApp(
      title: this.widget.title,
      theme: ThemeData(
        primaryColor: Colors.orange,
        accentColor: Colors.redAccent,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: "RobotoCondensed",
              ),
            ),
      ),
      //home: scaffold,
      routes: {
        "/": (ctx) => TabsScreen(favouriteMeal),
        TabsScreen.SCREEN: (ctx) => TabsScreen(favouriteMeal),
        RecipesScreen.SCREEN: (ctx) =>
            RecipesScreen(availableMeals, this.isMealFav),
        HowToMakeScreen.SCREEN: (ctx) =>
            HowToMakeScreen(this.toggleFv, this.isMealFav),
        FilterScreen.SCREEN: (ctx) => FilterScreen(filters, applyFilters),
      },
    );
  }

  StatefulWidget getMaterialApp() {
    return getApp(
      Scaffold(
        appBar: AppBar(
          title: Text(
            this.widget.title,
          ),
        ),
        body: this.widget.homeScreen,
      ),
    );
  }

  StatefulWidget getCupertinoApp() {
    return getApp(
      CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(this.widget.title),
        ),
        child: SafeArea(
          child: Material(child: this.widget.homeScreen),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    StatefulWidget app;
    if (Platform.isAndroid) {
      app = getMaterialApp();
    } else if (Platform.isIOS) {
      app = getCupertinoApp();
    } else {
      app = getMaterialApp();
    }

    return app;
  }
}
