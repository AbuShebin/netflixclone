import 'package:flutter/material.dart';
import 'package:netflixclone/presentation/home/widgets/number_card.dart';
import 'package:netflixclone/presentation/widgets/main_title.dart';
import 'package:netflixclone/presentation/widgets/main_title_card.dart';

class NumberTitleCard extends StatelessWidget {

  const NumberTitleCard({super.key,required this.posterList});

  final List<String> posterList;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
                10,
                (index) => NumberCard(
                  imageUrl: posterList[index],index: index,
                    )),
          ),
        ),
      ],
    );
  }
}
