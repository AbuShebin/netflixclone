import 'package:flutter/material.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/presentation/widgets/video_widget.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            videoWidget(imageurl: ''),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Title',
                style: kHomeTitleText,
              ),
            ),
            SizedBox(
                width: double.infinity,
                height: h * 0.05,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.play_arrow),
                  label: Text(
                    'Play',
                    style: kHomeTitleText,
                  ),
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.white)),
                )),
            kheight,
            SizedBox(
                width: double.infinity,
                height: h * 0.05,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.download,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Download',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(Colors.blueGrey.shade800)),
                ))
          ],
        ),
      ),
    );
  }
}
