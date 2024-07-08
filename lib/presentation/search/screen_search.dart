import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclone/application/search/search_bloc.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/domain/core/debounce/debounce.dart';
import 'package:netflixclone/presentation/search/widgets/search_idle.dart';
import 'package:netflixclone/presentation/search/widgets/search_result.dart';

final imageUrl = [
  'https://media.themoviedb.org/t/p/w533_and_h300_bestv2/zZqpAXxVSBtxV9qPBcscfXBcL2w.jpg',
  'https://media.themoviedb.org/t/p/w533_and_h300_bestv2/9faGSFi5jam6pDWGNd0p8JcJgXQ.jpg'
];

class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});

  Debouncer _debouncer = Debouncer(milliseconds: 1 * 1000);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        BlocProvider.of<SearchBloc>(context).add(Initialize());
      },
    );
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
            onChanged: (value) {
              _debouncer.run(
                () {
                  if (value.isEmpty) {
                    return null;
                  }
                  print(value);
                  BlocProvider.of<SearchBloc>(context)
                      .add(SearchMovie(movieQuery: value));
                },
              );
            },
          ),
          kheight,

          // Expanded(child: SearchREsultWidget()),
          Expanded(child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.SearchResultList.isEmpty) {
                return SearchIdleWidget();
              } else {
                return SearchREsultWidget();
              }
            },
          ))
        ],
      ),
    );
  }
}
