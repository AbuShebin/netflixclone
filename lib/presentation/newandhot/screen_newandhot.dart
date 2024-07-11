import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclone/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflixclone/core/colors.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflixclone/presentation/newandhot/widgets/coming_soon.dart';
import 'package:netflixclone/presentation/newandhot/widgets/everyones_watching.dart';
import 'package:netflixclone/presentation/widgets/app_bar_widgets.dart';
import 'package:netflixclone/presentation/widgets/video_widget.dart';
import 'package:intl/intl.dart';

class ScreenNewandHot extends StatelessWidget {
  const ScreenNewandHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(90),
              child: AppBar(
                title: const Text(
                  'New And Hot',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                ),
                actions: [
                  Icon(
                    Icons.cast,
                    size: 30,
                  ),
                  kWidth,
                  Container(
                    color: Colors.blue,
                    height: 20,
                    width: 30,
                  ),
                  kWidth
                ],
                bottom: TabBar(
                  dividerColor: Colors.transparent,
                  isScrollable: true,
                  labelColor: kBlackColor,
                  unselectedLabelColor: kwhiteColor,
                  labelStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: kRadius30,
                  ),
                  tabs: [
                    Tab(
                      text: 'Coming Soon 🍿',
                    ),
                    Tab(
                      text: 'Everyones watching',
                    )
                  ],
                ),
              )),
          body: TabBarView(children: [
            ComingSoomList(
              key: Key('coming soon'),
            ),
           EveryoneIsWatchinList(key: Key('EveryOne_is_watching'),)
          ]),
        ),
      ),
    );
  }
}

class ComingSoomList extends StatelessWidget {
  ComingSoomList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(HotAndNewEvent.loadDataInEveryOnesWatching());
      },
    );

    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.hasError) {
          return Text('SOme Error OCcured');
        } else if (state.everyoneIsWatchinList.isEmpty) {
          return Text('EveryoNeis watching List is Empty');
        } else {
          return ListView.builder(
            itemBuilder: (context, index) {
              final movie = state.everyoneIsWatchinList[index];

              String month = '';
              String day = '';

              try {
                final _date = DateTime.parse(movie.releaseDate!);

                final _formatedDate = DateFormat.yMMMd('en_US').format(_date);

                log(_formatedDate.toString());
                print(_formatedDate);
                month = _formatedDate.split(' ').first.substring(0, 3);
                day = movie.releaseDate?.split('-')[1] ?? '';
              } catch (_) {
                month = '';
                day = '';
              }
              final tv = state.everyoneIsWatchinList[index];
              return EveryOnesWatchingWidget(
                  posterPath: '$imageAppendUrl${tv.posterPath}',
                  movieName: tv.originalname??'No name provided',
                  description: tv.overview ?? 'No description');
            },
            itemCount: state.everyoneIsWatchinList.length,
          );
        }
      },
    );
  }
}

class EveryoneIsWatchinList extends StatelessWidget {
  EveryoneIsWatchinList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.hasError) {
          return Text('SOme Error OCcured');
        } else if (state.comingSoonList.isEmpty) {
          return Text('Coming soon List is Empty');
        } else {
          return ListView.builder(
            itemBuilder: (context, index) {
              final movie = state.comingSoonList[index];

              String month = '';
              String day = '';

              try {
                final _date = DateTime.parse(movie.releaseDate!);

                final _formatedDate = DateFormat.yMMMd('en_US').format(_date);

                log(_formatedDate.toString());
                print(_formatedDate);
                month = _formatedDate.split(' ').first.substring(0, 3);
                day = movie.releaseDate?.split('-')[1] ?? '';
              } catch (_) {
                month = '';
                day = '';
              }

              return ComingSoonWidget(
                id: movie.id.toString(),
                day: day,
                description: movie.overview ?? 'No Description Available',
                month: month,
                movieName: movie.originalTitle ?? 'No Movie Name',
                posterPath: '$imageAppendUrl${movie.posterPath}' ??
                    'No Poster Available',
              );
            },
            itemCount: state.comingSoonList.length,
          );
        }
      },
    );
  }
}
