import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem(this.meal);

  String get cookingComplexity {
    switch (meal.complexity) {
      case Complexity.Simple:
        {
          return "Simple";
        }
        break;
      case Complexity.Hard:
        {
          return "Hard";
        }
        break;
      case Complexity.Challenging:
        {
          return "Challenging";
        }
        break;
      default:
        {
          return "Unknown";
        }
    }
  }

  String get cost {
    switch (meal.affordability) {
      case Affordability.Affordable:
        {
          return "Affordable";
        }
        break;
      case Affordability.Pricey:
        {
          return "Pricey";
        }
        break;
      case Affordability.Luxurious:
        {
          return "Luxurious";
        }
        break;
      default:
        {
          return "Unknown";
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        margin: EdgeInsets.all(5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 10,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    child: Text(
                      meal.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 5),
                      Text('${meal.duration}mins'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.outdoor_grill),
                      SizedBox(width: 5),
                      Text('$cookingComplexity'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 5),
                      Text('$cost'),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
