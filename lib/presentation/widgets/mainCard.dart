import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
 final  String imageUrl ;
  MainCard({super.key,required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 130,
      height: 200,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(imageUrl)),
          borderRadius: BorderRadius.circular(7)),
    );
  }
}
