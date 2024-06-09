import 'package:flutter/cupertino.dart';

class MainTitle extends StatelessWidget {
  final String title;
  const MainTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}
