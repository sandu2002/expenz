import 'package:expenz/utils/colors.dart';
import 'package:flutter/material.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          "https://cdn.pixabay.com/photo/2021/07/01/09/18/money-6378855_640.png",
          width: 200,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "Expenz",
          style: TextStyle(
            fontSize: 40,
            color: kMainColor,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
