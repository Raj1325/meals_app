import 'package:flutter/material.dart';
import 'package:meals_app/screen/recipes_screen.dart';
import 'package:meals_app/widget/adaptive_navigator.dart';

class CategoryContainer extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryContainer(
      {@required this.id, @required this.title, this.color = Colors.orange});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          AdaptiveNavigator.navigateByName(context, RecipesScreen.SCREEN, {
        "id": this.id,
        "title": this.title,
      }),
      // onTap: () => AdaptiveNavigator.navigate(
      //     context, RecipesScreen(this.id, this.title)),
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
    );
  }
}
