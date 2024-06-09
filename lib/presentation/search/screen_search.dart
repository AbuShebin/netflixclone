import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/presentation/search/widgets/search_idle.dart';
import 'package:netflixclone/presentation/search/widgets/search_result.dart';

final imageUrl = [
  'https://media.themoviedb.org/t/p/w533_and_h300_bestv2/zZqpAXxVSBtxV9qPBcscfXBcL2w.jpg',
  'https://media.themoviedb.org/t/p/w533_and_h300_bestv2/9faGSFi5jam6pDWGNd0p8JcJgXQ.jpg'
];

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CupertinoSearchTextField(
            backgroundColor: Colors.grey.withOpacity(0.5),
            prefixIcon: Icon(
              CupertinoIcons.search,
              color: Colors.grey,
            ),
            suffixIcon: Icon(CupertinoIcons.xmark_circle),
            style: TextStyle(color: Colors.white),
          ),
          kheight,
          Expanded(child: SearchREsultWidget())
        ],
      ),
    );
  }
}

