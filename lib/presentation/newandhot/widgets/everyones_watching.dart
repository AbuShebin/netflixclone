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
    required this.posterPath,
    required this.movieName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // kHeight50,
        videoWidget(
          imageurl: posterPath,
        ),
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
        kheight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButtonWidget(
              icon: Icons.notifications,
              title: 'Remind Me',
              iconSize: 25,
              textSize: 16,
            ),
            kWidth20,

            CustomButtonWidget(
              icon: Icons.share,
              title: 'Share',
              iconSize: 25,
              textSize: 16,
            ),
            // kWidth,

            // kWidth,
            // CustomButtonWidget(
            //   icon: Icons.play_arrow,
            //   title: 'Play',
            //   iconSize: 25,
            //   textSize: 16,
            // ),
            // kWidth,
          ],
        )
      ],
    );
  }
}
