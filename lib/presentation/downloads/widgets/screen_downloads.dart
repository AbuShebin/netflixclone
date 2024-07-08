import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclone/application/downloads/downloads_bloc.dart';
import 'package:netflixclone/core/colors.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/presentation/widgets/app_bar_widgets.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final _widgetList = <Widget>[
    _SmartDownloads(),
    Section2(),
    Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: 'Downloads',
          )),
      body: ListView.separated(
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return _widgetList[index];
        },
        itemCount: _widgetList.length,
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 20,
          );
        },
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<DownloadsBloc>(context)
            .add(const DownloadsEvent.getDownloadsImages());
      },
    );

    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Text(
          'Introducting Downloads for you',
          style: TextStyle(
            color: kwhiteColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const Text(
          "we will download a personalised selection of \n movies and shows for you, so thers\n is always something to watch on your\n device",
          style: TextStyle(color: Colors.grey, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            // print(state.downloads);
            // print('------state.downloads----------');
            return SizedBox(
              height: size.height,
              width: size.width,
              child: SizedBox(
                width: size.width,
                height: size.width,
                child: state.isLoading == true
                    ? const Center(child: CircularProgressIndicator())
                    : Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            radius: size.width * 0.35,
                            backgroundColor: Colors.grey.withOpacity(0.5),
                          ),
                          DownloadsImageWidget(
                              image: state.downloads.isNotEmpty
                                  ? '$imageAppendUrl${state.downloads[0].posterPath.toString()}'
                                  : '',
                              // image: '',
                              margin: EdgeInsets.only(
                                left: 130,
                              ),
                              angle: 25,
                              // radius: 10,
                              size: Size(size.width * 0.35, size.width * 0.55)),
                          DownloadsImageWidget(
                              image: state.downloads.isNotEmpty
                                  ? '$imageAppendUrl${state.downloads[1].posterPath.toString()}'
                                  : '',

                              // image: '',
                              margin: EdgeInsets.only(
                                right: 130,
                              ),
                              angle: -20,
                              size: Size(size.width * 0.35, size.width * 0.55)),
                          DownloadsImageWidget(
                              // image: '',
                              image: state.downloads.isNotEmpty
                                  ? '$imageAppendUrl${state.downloads[2].posterPath.toString()}'
                                  : '',
                              radius: 5,
                              margin:
                                  EdgeInsets.only(left: 0, top: 0, bottom: 10),
                              size: Size(size.width * 0.4, size.width * 0.6)),
                        ],
                      ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: kButtonColorBlue,
            child: Text(
              "setup",
              style: TextStyle(
                  color: kwhiteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        MaterialButton(
          onPressed: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: kButtonColorWhite,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "See what you can download",
              style: TextStyle(
                  color: kBlackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(
            Icons.settings,
            color: kwhiteColor,
          ),
          Text(
            'Smart Downloads',
            style: TextStyle(
              color: kwhiteColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  DownloadsImageWidget(
      {required this.image,
      this.angle = 0,
      required this.margin,
      required this.size,
      this.radius = 10});

  final String image;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 100,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(image),
            )),
          ),
        ),
      ),
    );
  }
}
