

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflixclone/core/colors.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/presentation/search/screen_search.dart';
import 'package:netflixclone/presentation/search/widgets/title.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
  const SearchTextTitle(title: 'Top Searches',),
        kheight,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => TopSearchItemTile(),
              separatorBuilder: (context, index) => kheight,
              itemCount: 10),
        ),
      
        
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 70,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageUrl[1]), fit: BoxFit.cover),
                  ),
                  
        ),
        kWidth,
        const  Expanded(
            child: Text(
            'Movie Name',style: TextStyle(color: kwhiteColor,fontWeight: FontWeight.bold,fontSize: 16),
                    ),
          ),
       const   CircleAvatar(backgroundColor: kwhiteColor,radius: 25,
          child: CircleAvatar(backgroundColor: kBlackColor,
          child: Icon(Icons.play_circle_fill,color: kwhiteColor,),
          radius: 23,
          ),
          )
      ],
    );
  }
}
