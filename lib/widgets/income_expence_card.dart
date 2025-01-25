import 'package:expenz/utils/colors.dart';
import 'package:flutter/material.dart';

class IncomeExpenceCard extends StatefulWidget {

  final String title;
  final double amount;
  final String imageUrl;
  final Color bgColor;

  const IncomeExpenceCard({super.key, required this.title, required this.amount, required this.imageUrl, required this.bgColor,});

  @override
  State<IncomeExpenceCard> createState() => _IncomeExpenceCardState();
}

class _IncomeExpenceCardState extends State<IncomeExpenceCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: widget.bgColor,
      ),
      child: Row(children: [],),
    );
  }
}