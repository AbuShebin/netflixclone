import 'package:flutter/material.dart';
import 'package:netflixclone/core/colors.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflixclone/presentation/widgets/video_widget.dart';

class EveryOnesWatchingWidget extends StatelessWidget {

  final String posterPath;
final String movieName;
final String description;

  const EveryOnesWatchingWidget({
    required this. posterPath,
required this.movieName,
required this. description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        Text(
          movieName,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        kheight,
        Text(
         description,
          style: TextStyle(color: kGreyColor),
          overflow: TextOverflow.ellipsis,
          maxLines: 4,
        ),
        kHeight50,
        videoWidget(imageurl: posterPath,),
        kheight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButtonWidget(
              icon: Icons.share,
              title: 'Share',
              iconSize: 25,
              textSize: 16,
            ),
            kWidth,
            CustomButtonWidget(
              icon: Icons.add,
              title: 'My List',
              iconSize: 25,
              textSize: 16,
            ),
            kWidth,
            CustomButtonWidget(
              icon: Icons.play_arrow,
              title: 'Play',
              iconSize: 25,
              textSize: 16,
            ),
            kWidth,
          ],
        )
      ],
    );
  }
}
