import "dart:io";
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/screen/meals_screen.dart';
import 'package:meals_app/screen/reciepes_screen.dart';

class AdaptiveApp extends StatelessWidget {
  final String title;
  final Widget homeScreen;

  const AdaptiveApp(this.title, this.homeScreen);

  StatefulWidget getApp(Widget scaffold) {
    return MaterialApp(
      title: this.title,
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
      home: scaffold,
      routes: {
        RecipesScreen.SCREEN: (ctx) => RecipesScreen(),
        HowToMakeScreen.SCREEN: (ctx) => HowToMakeScreen(),
      },
    );
  }

  StatefulWidget getMaterialApp() {
    return getApp(
      Scaffold(
        appBar: AppBar(
          title: Text(
            this.title,
          ),
        ),
        body: this.homeScreen,
      ),
    );
  }

  StatefulWidget getCupertinoApp() {
    return getApp(
      CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(this.title),
        ),
        child: SafeArea(
          child: Material(child: this.homeScreen),
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
