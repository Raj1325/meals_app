import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screen/categories_screen.dart';
import 'package:meals_app/screen/fav_screen.dart';
import 'package:meals_app/widget/drawer_container.dart';

class TabsScreen extends StatefulWidget {
  static String SCREEN = "TabsScreen";
  final List<Meal> favMeal;

  TabsScreen(this.favMeal);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var screens;

  @override
  initState() {
    super.initState();
    this.screens = [
      {
        "pageTitle": "Categories",
        "screen": CategoriesScreen(),
      },
      {
        "pageTitle": "Favourite",
        "screen": FavoriteScreen(widget.favMeal),
      },
    ];
  }

  int _selectedPage = 0;

  void _switchTab(index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          screens[_selectedPage]["pageTitle"],
        ),
      ),
      body: screens[_selectedPage]["screen"],
      drawer: Drawer(
        child: DrawerContainer(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => _switchTab(index),
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPage,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: "Meals",
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.favorite),
            label: "Meals",
          )
        ],
      ),
    );
  }
}
