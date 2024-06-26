import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflixclone/core/colors.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflixclone/presentation/newandhot/widgets/coming_soon.dart';
import 'package:netflixclone/presentation/newandhot/widgets/everyones_watching.dart';
import 'package:netflixclone/presentation/widgets/app_bar_widgets.dart';
import 'package:netflixclone/presentation/widgets/video_widget.dart';

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
            _buildComingSoon(context: context),
            _buildEveryOnesWatching(),
          ]),
        ),
      ),
    );
  }

  Widget _buildComingSoon({required BuildContext context}) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemBuilder: (context, index) {
        return ComingSoonWidget();
      },
      itemCount: 5,
    );
  }

  Widget _buildEveryOnesWatching() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return EveryOnesWatchingWidget();
      },
    );
  }
}
