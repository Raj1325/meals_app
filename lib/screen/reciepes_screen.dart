import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'dart:io';

import 'package:meals_app/model/meal.dart';

class HowToMakeScreen extends StatefulWidget {
  static String SCREEN = "HowToMakeScreen";
  final Function togalFav;
  final Function isFavMeal;

  HowToMakeScreen(this.togalFav, this.isFavMeal);

  @override
  _HowToMakeScreenState createState() => _HowToMakeScreenState();
}

class _HowToMakeScreenState extends State<HowToMakeScreen> {
  Widget getReciepe(BuildContext context, Meal meal) {
    return ListView(
      children: [
        image(meal.imageUrl),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              getListContainer(context, "Ingredients", meal.ingredients),
              SizedBox(
                height: 20,
              ),
              getListContainer(context, "Steps", meal.steps),
            ],
          ),
        ),
      ],
    );
  }

  Widget image(String imageUrl) {
    return Container(
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  List<Widget> getListTile(List<String> list) {
    List<Widget> result = List<Widget>.empty(growable: true);
    for (int i = 0; i < list.length; i++) {
      result.add(ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.purple,
          child: Text("#${i + 1}"),
        ),
        title: Text(
          list[i],
          style: TextStyle(fontFamily: "Raleway", fontSize: 20),
          softWrap: true,
          textAlign: TextAlign.justify,
        ),
      ));
    }

    return result;
  }

  Widget getListContainer(
      BuildContext context, String title, List<String> list) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Flexible(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            title == "Ingredients"
                ? Icon(Icons.add_shopping_cart)
                : Icon(Icons.article),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 15, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: title == "Steps"
                ? getListTile(list)
                : [
                    ...list.map((data) {
                      return Row(
                        children: [
                          Icon(
                            Icons.fiber_manual_record,
                            size: 8,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: Text(
                              data,
                              style: TextStyle(
                                  fontFamily: "Raleway", fontSize: 20),
                              softWrap: true,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      );
                    }).toList()
                  ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map;
    final String id = routeArgs["id"];
    final Meal meal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);
    return Platform.isAndroid
        ? Scaffold(
            appBar: AppBar(
              title: Text(meal.title),
            ),
            body: getReciepe(context, meal),
            floatingActionButton: FloatingActionButton(
              child: Icon(
                widget.isFavMeal(meal.id) ? Icons.star : Icons.star_border,
              ),
              onPressed: () {
                widget.togalFav(meal.id);
              },
            ),
          )
        : CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text(meal.title),
            ),
            child: SafeArea(
              child: Material(child: getReciepe(context, meal)),
            ),
          );
    ;
  }
}
