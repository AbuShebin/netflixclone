import 'package:flutter/material.dart';
import 'package:netflixclone/core/constants.dart';

class MoreScreenVideoCardWidget extends StatelessWidget {
  final String titleOne;
  final String titleTwo;
  final String titleThree;
  final String imageUrl;

  MoreScreenVideoCardWidget(
      {required this.titleOne,
      required this.titleTwo,
      required this.titleThree,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Row(
      children: [
        kWidth,
        CircleAvatar(
          backgroundColor: Colors.red,
          radius: h * 0.003,
        ),
        kWidth,
        Container(
          height: h * 0.13,
          width: w * 0.45,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(imageUrl))),
        ),
        kWidth,
        Container(
          height: h * 0.13,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titleOne,
                style: kHomeTitleText,
              ),
              Text(
                titleTwo,
                style: kHomeTitleText,
              ),
              Text(titleThree),
            ],
          ),
        )
      ],
    );
  }
}
