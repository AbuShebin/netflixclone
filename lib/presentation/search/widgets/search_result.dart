import 'package:flutter/material.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/presentation/search/screen_search.dart';
import 'package:netflixclone/presentation/widgets/mainCard.dart';
import 'package:netflixclone/presentation/search/widgets/title.dart';

const String _imageUrl =
    'https://image.tmdb.org/t/p/original/zDi2U7WYkdIoGYHcYbM9X5yReVD.jpg';

class SearchREsultWidget extends StatelessWidget {
  const SearchREsultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextTitle(title: 'Movies & TV'),
        kheight,
        Expanded(
            child: GridView.count(
          childAspectRatio: 1 / 1.4,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          crossAxisCount: 3,
          shrinkWrap: true,
          children: List.generate(20, (index) {
            return MainCard();
          }),
        ))
      ],
    );
  }
}
