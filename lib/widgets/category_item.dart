import 'package:flutter/material.dart';
import 'extensions.dart';

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color backgroundColor;
  final String title;

  CategoryItem({this.title, this.icon, this.color, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(13)),
            color: backgroundColor,
            /*  boxShadow: AppTheme.shadow*/),
          child: Icon(
            icon,
            color: color,
          ),
        ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13))),
        SizedBox(
          height: 10,
        ),
        Text(
          title,
        ),
      ],
    );
  }
}