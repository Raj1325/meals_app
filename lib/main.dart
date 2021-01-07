import 'package:flutter/material.dart';
import 'package:meals_app/adaptive_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdaptiveApp("DeliMeals", Text("Hello"));
  }
}
