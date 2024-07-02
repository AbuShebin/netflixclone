import 'package:flutter/material.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/presentation/widgets/mainCard.dart';
import 'package:netflixclone/presentation/search/widgets/search_result.dart';
import 'package:netflixclone/presentation/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  final String title;
  const MainTitleCard({required this.title});

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
            children: List.generate(10, (index) => MainCard()),
          ),
        )
      ],
    );
  }
}
