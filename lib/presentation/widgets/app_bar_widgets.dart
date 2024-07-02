import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            ),
          ),
          Spacer(),
          Icon(
            Icons.cast,
            size: 30,
          ),
          Container(
            color: Colors.blue,
            height: 30,
            width: 30,
          )
        ],
      ),
    );
  }
}
