import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
   String _imageUrl =
    'https://image.tmdb.org/t/p/original/zDi2U7WYkdIoGYHcYbM9X5yReVD.jpg';
   MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 130,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(_imageUrl),fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(7) 
      ),
    );
  }
}