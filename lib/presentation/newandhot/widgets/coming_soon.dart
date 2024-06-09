import 'package:flutter/material.dart';
import 'package:netflixclone/core/colors.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflixclone/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        
        const SizedBox(
          width: 50,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('FEB', style: TextStyle(fontSize: 10, color: kGreyColor)),
              Text(
                '11',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 500,
          child:const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              videoWidget(),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    'Tall Girl 2',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -1),
                  )),
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
              Text('Coming on Fridary'),
              kheight,
              Text(
                'Tall Girl 2',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kheight,
              Text(
                'Landing the lead in the school musical is a dream come true for Jodi, until the pressure sends her confidence - and her relationship - into a tailspain.',
                style: TextStyle(color: kGreyColor),
              )
            ],
          ),
        ),
      ],
    );
  }
}
