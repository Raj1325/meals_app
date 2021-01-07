import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget {
  final String title;
  final Color color;

  const CategoryContainer({@required this.title, this.color = Colors.orange});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
