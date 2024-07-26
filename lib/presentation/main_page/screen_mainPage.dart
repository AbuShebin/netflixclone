import 'package:flutter/material.dart';
import 'package:netflixclone/core/colors.dart';
import 'package:netflixclone/presentation/More/morePage.dart';
import 'package:netflixclone/presentation/downloads/screen_downloads.dart';
import 'package:netflixclone/presentation/home/screen_home.dart';
import 'package:netflixclone/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflixclone/presentation/newandhot/screen_newandhot.dart';
import 'package:netflixclone/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final _pages = [
    ScreenHome(),
    ScreenSearch(),
    ScreenNewandHot(),
    ScreenDownloads(),
    Morepage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int index, child) {
          return _pages[index];
        },
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
