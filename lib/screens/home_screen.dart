import 'package:expenz/models/expense.model.dart';
import 'package:expenz/models/income_model.dart';
import 'package:expenz/service/user_services.dart';
import 'package:expenz/utils/colors.dart';
import 'package:expenz/utils/constants.dart';
import 'package:expenz/widgets/expense_card.dart';
import 'package:expenz/widgets/income_expence_card.dart';
import 'package:expenz/widgets/line_chart.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final List<Expense> expenseList;
  final List<Income> incomeList;
  const HomeScreen(
      {super.key, required this.expenseList, required this.incomeList});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //for store the username

  String username = "";
  double expensetotal = 0;
  double incometotal = 0;
  @override
  void initState() {
    super.initState();
    //get the username form the shared preferences

    UserService.getUserDetails().then((value) {
      if (value['username'] != null) {
        setState(() {});
        username = value['username']!;
      }
    });
    setState(() {
      //total amount of expenses
      for (var i = 0; i < widget.expenseList.length; i++) {
        expensetotal += widget.expenseList[i].amount;
      }

      //total amount of income
      for (var i = 0; i < widget.incomeList.length; i++) {
        incometotal += widget.incomeList[i].amount;
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          //main column
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.28,
                decoration: BoxDecoration(
                  color: kMainColor.withOpacity(0.17),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(kDefalutPadding),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: kMainColor, width: 3),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                "https://cdn.pixabay.com/photo/2017/10/19/18/26/woman-2868727_640.jpg",
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Welcome $username",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.notifications,
                              color: kMainColor,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: kDefalutPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IncomeExpenceCard(
                              title: "Income",
                              amount: incometotal,
                              imageUrl:
                                  "https://cdn-icons-png.flaticon.com/512/8140/8140224.png",
                              bgColor: kGreen,
                            ),
                            IncomeExpenceCard(
                              title: "Expence",
                              amount: expensetotal,
                              imageUrl:
                                  "https://cdn-icons-png.freepik.com/512/10502/10502550.png",
                              bgColor: kRed,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //Line chart
              Padding(
                padding: const EdgeInsets.all(kDefalutPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Speed Frequency",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    LineChartSample(),
                  ],
                ),
              ),
              //recent transactions
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefalutPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Recents Transactions",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        widget.expenseList.isEmpty
                            ? Center(
                                child: Text(
                                  "No expense added yet, add some expense to see here",
                                  style: TextStyle(
                                    fontSize: 16,
                                    //fontWeight: FontWeight.bold,
                                    color: kGrey,
                                  ),
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: widget.expenseList.length,
                                itemBuilder: (context, index) {
                                  final Expense = widget.expenseList[index];

                                  return ExpenceCard(
                                      title: Expense.title,
                                      date: Expense.date,
                                      amount: Expense.amount,
                                      category: Expense.category,
                                      description: Expense.description,
                                      createdAt: Expense.time);
                                })
                      ],
                    ),SizedBox(height: 20,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
