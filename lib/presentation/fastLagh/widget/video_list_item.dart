import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflixclone/core/colors.dart';

class VideoListItem extends StatelessWidget {
  int index;
  VideoListItem({required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //left side
                CircleAvatar(
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.volume_off,
                        color: Colors.white,
                      )),
                ),

                //right side
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://image.tmdb.org/t/p/original/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg'),
                        radius: 30,
                      ),
                    ),
                    VideoActions(icon: Icons.emoji_emotions, title: 'lol'),
                    VideoActions(icon: Icons.add, title: 'My list'),
                    VideoActions(icon: Icons.share, title: 'share'),
                    VideoActions(icon: Icons.play_arrow, title: 'play')
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActions extends StatelessWidget {
  final IconData icon;
  final String title;
  VideoActions({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
          child: Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
        ),
        Text(
          title,
          style: TextStyle(color: kwhiteColor, fontSize: 16),
        )
      ],
    );
  }
}
