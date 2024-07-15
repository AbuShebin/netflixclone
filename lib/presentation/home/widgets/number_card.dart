import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflixclone/core/colors.dart';

class NumberCard extends StatelessWidget {
 final String imageUrl ;



  final int index;
  NumberCard({required this.index,required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 200,
            ),
            Container(
              width: 130,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(imageUrl), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(7)),
            ),
          ],
        ),
        Positioned(
          left: 13,
          bottom: -40,
          child: BorderedText(
              strokeColor: Colors.white,
              strokeWidth: 10.0,
              child: Text(
                "${index + 1}",
                style:const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kBlackColor,
                  fontSize: 150,
                  decoration: TextDecoration.none,
                  decorationColor: Colors.black,
                ),
              )),
        )
      ],
    );
  }
}
