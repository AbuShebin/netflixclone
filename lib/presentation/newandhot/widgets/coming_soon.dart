import 'package:flutter/material.dart';
import 'package:netflixclone/core/colors.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflixclone/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;

  const ComingSoonWidget(
      {required this.id,
      required this.day,
      required this.description,
      required this.month,
      required this.movieName,
      required this.posterPath});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(month, style: TextStyle(fontSize: 10, color: kGreyColor)),
              Text(
                day,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              videoWidget(
                imageurl: posterPath,
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(movieName,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            // letterSpacing: -1
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1)),
                  Row(
                    children: [
                      CustomButtonWidget(
                        icon: Icons.all_out_sharp,
                        title: 'Remind me',
                        iconSize: 20,
                        textSize: 12,
                      ),
                      kWidth,
                      kWidth,
                      CustomButtonWidget(
                        icon: Icons.info,
                        title: 'Info',
                        iconSize: 20,
                        textSize: 12,
                      ),
                      kWidth,
                      kWidth,
                    ],
                  )
                ],
              ),
              kheight,
              Text('Coming on $day $month'),
              kheight,
              Text(movieName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1),
              kheight,
              Text(
                description,
                style: TextStyle(color: kGreyColor),
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
              )
            ],
          ),
        ),
      ],
    );
  }
}
