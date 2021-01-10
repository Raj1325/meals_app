import 'package:flutter/material.dart';
import 'package:meals_app/screen/filter_screen.dart';
import 'package:meals_app/widget/adaptive_navigator.dart';

class DrawerContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          color: Theme.of(context).accentColor,
          height: 200,
          width: double.infinity,
          alignment: Alignment.centerLeft,
          child: Text(
            "Cooking",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.restaurant),
          title: Text(
            "Meals",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
          ),
          onTap: () {
            Scaffold.of(context).openEndDrawer();
            print(Navigator.of(context).canPop());
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text(
            "Filter",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
          ),
          onTap: () {
            Scaffold.of(context).openEndDrawer();
            AdaptiveNavigator.navigateByName(context, FilterScreen.SCREEN, {});
          },
        )
      ],
    );
  }
}
