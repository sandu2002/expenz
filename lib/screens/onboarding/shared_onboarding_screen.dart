import 'package:expenz/utils/colors.dart';
import 'package:expenz/utils/constants.dart';
import 'package:flutter/material.dart';

class SharedOnboardingScreen extends StatelessWidget {
  final String title;
  final String imagepath;
  final String description;

  const SharedOnboardingScreen({
    super.key,
    required this.title,
    required this.imagepath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefalutPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            imagepath,
            width: 300,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: kBlack,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: kGrey,
            ),
          )
        ],
      ),
    );
  }
}
