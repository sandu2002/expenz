import 'package:expenz/models/expense.model.dart';
import 'package:expenz/utils/colors.dart';
import 'package:expenz/utils/constants.dart';
import 'package:expenz/widgets/expense_card.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatefulWidget {
  final List<Expense> expensesList;
  final void Function(Expense) onDissmissedExpenses;
  const TransactionScreen({
    super.key,
    required this.expensesList,
    required this.onDissmissedExpenses,
  });

  @override
  State<TransactionScreen> createState() => _TransactiosScreenState();
}

class _TransactiosScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(kDefalutPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "See your financial report",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: kMainColor,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              const Text(
                "Expenses",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: kBlack,
                ),
              ),
              SizedBox(
                height: 20,
              ),

              //show all expenses
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: widget.expensesList.length,
                          itemBuilder: (context, index) {
                            final Expense = widget.expensesList[index];

                            return Dismissible(
                              key: ValueKey(Expense),
                              direction: DismissDirection.startToEnd,
                              onDismissed: (direction) {
                                setState(() {
                                  widget.onDissmissedExpenses(Expense);
                                });
                              },
                              child: ExpenceCard(
                                  title: Expense.title,
                                  date: Expense.date,
                                  amount: Expense.amount,
                                  category: Expense.category,
                                  description: Expense.description,
                                  createdAt: Expense.time),
                            );
                          })
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
