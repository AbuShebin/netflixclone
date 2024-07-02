import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:netflixclone/core/colors.dart';
import 'package:netflixclone/core/constants.dart';
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
                    ListView(children: const [
                      BackgroundCard(),
                      MainTitleCard(
                        title: 'Released in Past Year',
                      ),
                      kheight,
                      MainTitleCard(
                        title: 'Trending Now',
                      ),
                      kheight,
                      MainTitle(title: 'Top 10 Tv Shows In India Today'),
                      kheight,
                      NumberTitleCard(),
                      kheight,
                      MainTitleCard(title: 'Tense Dramas'),
                      kheight,
                      MainTitleCard(title: 'South Indian Cinema'),
                      kheight,
                    ]),
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
