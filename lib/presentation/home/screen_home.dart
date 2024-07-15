import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclone/application/home_bloc/home_bloc.dart';
import 'package:netflixclone/core/colors.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/domain/hot%20and%20new/hot_and_new_response/models/hot_and_new_rep.dart';
import 'package:netflixclone/presentation/home/widgets/background_card.dart';
import 'package:netflixclone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflixclone/presentation/home/widgets/number_card.dart';
import 'package:netflixclone/presentation/home/widgets/number_title_card.dart';
import 'package:netflixclone/presentation/widgets/mainCard.dart';
import 'package:netflixclone/presentation/search/widgets/search_result.dart';
import 'package:netflixclone/presentation/widgets/main_title.dart';
import 'package:netflixclone/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        // BlocProvider.of<HomeBloc>(context).add(HomeEvent.getHomeScreenData());
        BlocProvider.of<HomeBloc>(context).add(GetHomeScreenData());
      },
    );

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (context, value, child) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;
                  print(direction);
                  if (direction == ScrollDirection.reverse) {
                    scrollNotifier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    scrollNotifier.value = true;
                  }
                  return true;
                },
                child: Stack(
                  children: [
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if (state.isLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          );
                        } else if (state.hasError) {
                          // print(state.toString());
                          print(state);
                          return const Center(
                            child: Text('Error while loading data',
                                style: TextStyle(color: Colors.white)),
                          );
                        }
                        //released past year
                        final _releasedPastYear = state.pastYearMovieList.map(
                          (m) {
                            return "$imageAppendUrl${m.posterPath}";
                          },
                        ).toList();
                        // _releasedPastYear.shuffle();

                        //trending
                        final _trending = state.trendingTvList.map(
                          (m) {
                            return "$imageAppendUrl${m.posterPath}";
                          },
                        ).toList();
                        _trending.shuffle();

                        //tense dramas
                        final _tenseDramas = state.tenseDramasMovieList.map(
                          (m) {
                            return "$imageAppendUrl${m.posterPath}";
                          },
                        ).toList();
                        // _tenseDramas.shuffle();

                        //south Indian Movies
                        final _southIndianMovies =
                            state.southIndianMovieList.map(
                          (m) {
                            return "$imageAppendUrl${m.posterPath}";
                          },
                        ).toList();
                        _southIndianMovies.shuffle();

                        print(_southIndianMovies);
                        print(
                            'south indian movie lenght =====${_southIndianMovies.length}');

                        //top 10 tv shows
                        final _top10TvShows = state.trendingTvList.map(
                          (m) {
                            return "$imageAppendUrl${m.posterPath}";
                          },
                        ).toList();
                        // _top10TvShows.shuffle();

                        //ListView
                        return ListView(children: [
                          if(_trending.isNotEmpty)
                          BackgroundCard(imageUrl: '$imageAppendUrl${state.trendingTvList.first.posterPath}',),
                          if (_releasedPastYear.length >= 10)
                            MainTitleCard(
                              title: 'Released in Past Year',
                              posterList: _releasedPastYear.sublist(0, 10),
                            ),
                          kheight,
                          if (_trending.length >= 10)
                            MainTitleCard(
                              title: 'Trending Now',
                              posterList: _trending.sublist(0, 10),
                            ),
                          kheight,
                          MainTitle(title: 'Top 10 Tv Shows In India Today'),
                          kheight,
                          if (_top10TvShows.length >= 10)
                            NumberTitleCard(
                              posterList: _top10TvShows,
                            ),
                          kheight,
                          if (_tenseDramas.length >= 10)
                            MainTitleCard(
                              title: 'Tense Dramas',
                              posterList: _tenseDramas.sublist(0, 10),
                            ),
                          kheight,
                          if (_southIndianMovies.length >= 10)
                            MainTitleCard(
                              title: 'South Indian Cinema',
                              posterList: _southIndianMovies.sublist(0, 10),
                            ),
                          kheight,
                        ]);
                      },
                    ),
                    scrollNotifier.value == true
                        ? AnimatedContainer(
                            duration: Duration(milliseconds: 1000),
                            width: double.infinity,
                            height: 90,
                            color: Colors.black.withOpacity(0.5),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    kWidth,
                                    Image.network(
                                      'https://avatars.mds.yandex.net/i?id=eb42a3b127c612481464613c3497c109a412af3e-12539473-images-thumbs&n=13',
                                      width: 60,
                                      height: 60,
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.cast,
                                      size: 30,
                                    ),
                                    kWidth,
                                    Container(
                                      color: Colors.blue,
                                      height: 30,
                                      width: 30,
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('Tv Shows', style: kHomeTitleText),
                                    Text('Movies', style: kHomeTitleText),
                                    Text('Categories', style: kHomeTitleText),
                                  ],
                                )
                              ],
                            ),
                          )
                        : kheight
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kwhiteColor),
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(
          'Play',
          style: TextStyle(fontSize: 20, color: kBlackColor),
        ),
      ),
      icon: Icon(
        Icons.play_arrow,
        size: 25,
        color: kBlackColor,
      ),
    );
  }
}
