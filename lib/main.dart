import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclone/application/bloc/downloads_bloc.dart';
import 'package:netflixclone/core/colors.dart';
import 'package:netflixclone/domain/core/di/injectable.dart';
import 'package:netflixclone/presentation/main_page/screen_mainPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => getIt<DownloadsBloc>(),)
    ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,),
          colorScheme: ColorScheme.dark(),
          textTheme: TextTheme(displayMedium: TextStyle(color: Colors.white)),
          scaffoldBackgroundColor: backgroundColor,
        ),
        home: ScreenMainPage(),
      ),
    );
  }
}