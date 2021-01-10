import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "dart:io";

class AdaptiveNavigator {
  static dynamic _getIOSScreen(Widget screen) {
    return CupertinoPageRoute(
      builder: (_) {
        return screen;
      },
    );
  }

  static dynamic _getAndroidScreen(Widget screen) {
    return MaterialPageRoute(
      builder: (_) {
        return screen;
      },
    );
  }

  static navigate(BuildContext context, Widget screen) {
    if (Platform.isAndroid) {
      Navigator.of(context).push(_getAndroidScreen(screen));
    } else {
      Navigator.of(context).push(_getIOSScreen(screen));
    }
  }

  static Future navigateByName(
      BuildContext context, String screenName, Map params) {
    return Navigator.of(context).pushNamed(screenName, arguments: params);
  }
}
