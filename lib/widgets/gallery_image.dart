import 'package:flutter/material.dart';

class GalleryImageItem extends StatelessWidget{
  final String image;

  GalleryImageItem(this.image);

  @override
  Widget build(BuildContext context){
    return GridTile(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(13)),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}