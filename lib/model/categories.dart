import 'package:flutter/cupertino.dart';

class MealCategory {
  final id;
  final title;
  final color;
  const MealCategory({
    @required this.id,
    @required this.title,
    this.color,
  });
}
