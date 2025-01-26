import 'package:expenz/utils/colors.dart';
import 'package:expenz/utils/constants.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class addNewScreen extends StatefulWidget {
  const addNewScreen({super.key});

  @override
  State<addNewScreen> createState() => _addNewScreenState();
}

// ignore: camel_case_types
class _addNewScreenState extends State<addNewScreen> {
  //state to track the expence or income
  int _selectedMethode = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selectedMethode ==0 ? kRed: kGreen,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefalutPadding),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefalutPadding),
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedMethode = 0;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: _selectedMethode == 0 ? kRed : kWhite,
                                borderRadius: BorderRadius.circular(100)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 60, vertical: 10),
                              child: Text(
                                "Expence",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: _selectedMethode == 0 ? kWhite : kBlack,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedMethode = 1;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: _selectedMethode == 1? kGreen: kWhite,
                                borderRadius: BorderRadius.circular(100)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 55, vertical: 10),
                              child: Text(
                                "Income",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: _selectedMethode == 1 ? kWhite : kBlack,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
