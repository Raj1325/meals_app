import "dart:io";
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveApp extends StatelessWidget {
  final String title;
  final Widget homeScreen;

  const AdaptiveApp(this.title, this.homeScreen);

  StatefulWidget getMaterialApp() {
    return MaterialApp(
      title: this.title,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
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
    return CupertinoApp(
      title: title,
      theme: CupertinoThemeData(
        primaryColor: Colors.blue,
      ),
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(this.title),
        ),
        child: this.homeScreen,
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