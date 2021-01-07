import 'package:flutter/material.dart';
import 'package:meals_app/screen/recipes_screen.dart';
import 'package:meals_app/widget/adaptive_navigator.dart';

class CategoryContainer extends StatelessWidget {
  final String title;
  final Color color;

  const CategoryContainer({@required this.title, this.color = Colors.orange});

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return RecipesScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => AdaptiveNavigator.navigate(context, RecipesScreen()),
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Text(
              this.title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                this.color.withOpacity(0.7),
                this.color,
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
