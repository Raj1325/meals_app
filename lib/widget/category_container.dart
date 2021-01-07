import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget {
  final String title;
  final Color color;

  const CategoryContainer({@required this.title, this.color = Colors.orange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Text(this.title),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            this.color.withOpacity(0.7),
            this.color,
          ],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
