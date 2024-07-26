import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/core/colors.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/presentation/home/widgets/custom_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  final String imageUrl;
  const BackgroundCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.cover),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButtonWidget(icon: Icons.add, title: 'Add'),
                _playButton(),
                const CustomButtonWidget(icon: Icons.info, title: 'Info')
              ],
            ),
          ),
        )
      ],
    );
  }
}

TextButton _playButton() {
  return TextButton.icon(
    onPressed: () {},
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(kwhiteColor),
    ),
    label: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        'Play',
        style: TextStyle(fontSize: 20, color: kBlackColor),
      ),
    ),
    icon: Icon(
      Icons.play_arrow,
      size: 25,
      color: kBlackColor,
    ),
  );
}
