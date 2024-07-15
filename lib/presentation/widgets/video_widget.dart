import 'package:flutter/material.dart';
import 'package:netflixclone/core/colors.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/presentation/home/widgets/custom_button_widget.dart';

class videoWidget extends StatelessWidget {
  final String imageurl;
  const videoWidget({
    required this.imageurl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            imageurl,
            fit: BoxFit.fitWidth,
            loadingBuilder:
                (BuildContext _, Widget child, ImageChunkEvent? progress) {
              if (progress == null) {
                return child;
              } else {
                return Center(child: CircularProgressIndicator(strokeWidth: 2,));
              }
            },
            errorBuilder: (BuildContext _, Object a, StackTrace? trace) {
              return Center(child: Icon(Icons.wifi));
            },
          ),
        ),
        Positioned(
          bottom: 0,
          right: 10,
          child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.5),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.volume_off,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
