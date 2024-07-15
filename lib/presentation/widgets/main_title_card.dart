import 'package:flutter/material.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/presentation/widgets/mainCard.dart';
import 'package:netflixclone/presentation/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  final String title;
  final List<String> posterList;
  MainTitleCard({required this.title,required this.posterList});

  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        kheight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
                posterList.length,
                (index) => MainCard(
                      imageUrl: posterList[index],
                    )),
          ),
        )
      ],
    );
  }
}
