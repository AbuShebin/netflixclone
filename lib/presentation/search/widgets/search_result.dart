import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclone/application/search/search_bloc.dart';
import 'package:netflixclone/core/constants.dart';
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
        Expanded(child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            return GridView.count(
              childAspectRatio: 1 / 1.4,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              crossAxisCount: 3,
              shrinkWrap: true,
              children: List.generate(20, (index) {
                final movie = state.SearchResultList[index];
                return MainCard(
                  imageUrl: movie.posterImageUrl,
                );
              }),

            );
          },
        ))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  final  String imageUrl ;
  MainCard({super.key,required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 130,
      height: 200,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(imageUrl),fit: BoxFit.cover
          ),
          borderRadius: BorderRadius.circular(7)),
    );
  }
}

