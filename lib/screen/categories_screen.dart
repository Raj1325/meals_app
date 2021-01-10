import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/model/categories.dart';
import 'package:meals_app/widget/category_container.dart';

class CategoriesScreen extends StatelessWidget {
  static String SCREEN = "CategoriesScreen";
  final List<MealCategory> categories = DUMMY_CATEGORIES;

  const CategoriesScreen();

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      children: [
        ...categories
            .map((categoryData) => CategoryContainer(
                  id: categoryData.id,
                  title: categoryData.title,
                  color: categoryData.color,
                ))
            .toList()
      ],
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
