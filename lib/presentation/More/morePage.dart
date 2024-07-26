import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclone/application/home_bloc/home_bloc.dart';
import 'package:netflixclone/core/colors.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/presentation/widgets/app_bar_widgets.dart';
import 'package:netflixclone/presentation/widgets/moreScreenVideoCardWidget.dart';

class Morepage extends StatelessWidget {
  Morepage({super.key});

  List<String> downloadsMOvieList = [];

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        return BlocProvider.of<HomeBloc>(context).add(GetHomeScreenData());
      },
    );

    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: 'My Netflix',
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          kHeight50,
          Image(
            image: AssetImage('assets/mrbean.png'),
            height: h * 0.13,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Mike",
                style: TextStyle(
                  color: kwhiteColor,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kheight,
              Icon(Icons.arrow_drop_down)
            ],
          ),
          kHeight50,
          const Row(
            children: [
              kWidth,
              CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              ),
              kWidth,
              Text(
                'Notifications',
                style: TextStyle(
                  color: kwhiteColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
          kheight,
          MoreScreenVideoCardWidget(
            titleOne: 'New Arrival',
            titleTwo: 'ONE PIECE',
            titleThree: "Today",
            imageUrl: 'assets/onepiece.jpg',
          ),
          kheight,
          const Row(
            children: [
              kWidth,
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.download_sharp,
                  color: Colors.white,
                ),
              ),
              kWidth,
              Text(
                'Downloads',
                style: TextStyle(
                  color: kwhiteColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
          kheight,
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return SizedBox(
                height: 200,
                child: ListView.builder(
                  // shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    String imageUrl =
                        state.trendingTvList[index].posterPath.toString();

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        width: w * 0.7,
                        child: Image.network(
                          '$imageAppendUrl$imageUrl',
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  itemCount: state.trendingTvList.length,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
