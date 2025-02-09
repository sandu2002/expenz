import 'package:expenz/models/expense.model.dart';
import 'package:expenz/models/income_model.dart';
import 'package:expenz/utils/colors.dart';
import 'package:expenz/utils/constants.dart';
import 'package:expenz/widgets/expense_card.dart';
import 'package:expenz/widgets/income_card.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatefulWidget {
  final List<Expense> expensesList;
  final List<Income> incomeList;
  final void Function(Expense) onDissmissedExpenses;
  final void Function(Income) onDissmissedIncome;
  const TransactionScreen({
    super.key,
    required this.expensesList,
    required this.onDissmissedExpenses,
    required this.incomeList,
    required this.onDissmissedIncome,
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
                height: MediaQuery.of(context).size.height * 0.32,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      widget.expensesList.isEmpty
                      ? Center(
                        child: Text("No expenses added yet, add some expenses to see here",
                            style: TextStyle(
                            fontSize: 16,
                            //fontWeight: FontWeight.bold,
                            color: kGrey,
                              ),),
                      )
                      :ListView.builder(
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
              ),
              SizedBox(
                height: 20,
              ),
              //show all incomes
              const Text(
                "Income",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: kBlack,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.32,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      widget.incomeList.isEmpty
                      ? Center(
                        child: Text("No income added yet, add some income to see here",
                            style: TextStyle(
                            fontSize: 16,
                            //fontWeight: FontWeight.bold,
                            color: kGrey,
                              ),),
                      )
                      :ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: widget.incomeList.length,
                          itemBuilder: (context, index) {
                            final Income = widget.incomeList[index];

                            return Dismissible(
                              key: ValueKey(Income),
                              direction: DismissDirection.startToEnd,
                              onDismissed: (direction) {
                                setState(() {
                                  widget.onDissmissedIncome(Income);
                                });
                              },
                              child: IncomeCard(
                                  title: Income.title,
                                  date: Income.date,
                                  amount: Income.amount,
                                  category: Income.category,
                                  description: Income.description,
                                  createdAt: Income.time),
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
