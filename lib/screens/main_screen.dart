import 'package:expenz/models/expense.model.dart';
import 'package:expenz/models/income_model.dart';
import 'package:expenz/screens/add_new_screen.dart';
import 'package:expenz/screens/budget_screen.dart';
import 'package:expenz/screens/home_screen.dart';
import 'package:expenz/screens/profile_screen.dart';
import 'package:expenz/screens/transactions_screen.dart';
import 'package:expenz/service/expense_service.dart';
import 'package:expenz/service/income_service.dart';
import 'package:expenz/utils/colors.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //current page index
  int _selectedIndex = 0;

  List<Expense> expenseList = [];
  List<Income> incomeList = [];

  //Function to fetch expenses
  void fetchAllExpenses() async {
    List<Expense> loadedExpenses = await ExpenceService().loadExpenses();
    setState(() {
      expenseList = loadedExpenses;
    });
  }

  //Function to fetch all incomes
  void fetchAllIncomes() async {
    List<Income> loadedIncomes = await IncomeServices().loadIncomes();
    setState(() {
      incomeList = loadedIncomes;
    });
  }

  //Function to add new Expense
  void addNewExpense(Expense newExpense) {
    ExpenceService().saveExpense(newExpense, context);

    //Update the list of expenses
    setState(() {
      expenseList.add(newExpense);
    });
  }

  //Function to add a new Income
  void addNewIncome(Income newIncome) {
    IncomeServices().saveIncome(newIncome, context);

    //Update the list of Income
    setState(() {
      incomeList.add(newIncome);
      print(incomeList.length);
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      fetchAllExpenses();
      fetchAllIncomes();
    });
  }

  @override
  Widget build(BuildContext context) {
    //screenlist
    final List<Widget> pages = [
      HomeScreen(),
      TransactionScreen(),
      AddNewScreen(
        addExpense: addNewExpense,
        addIncome: addNewIncome,
      ),
      BudgetScreen(),
      ProfileScreen()
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: kWhite,
        selectedItemColor: kMainColor,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.list_rounded,
            ),
            label: "Transactions",
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: kMainColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add,
                color: kWhite,
                size: 30,
              ),
            ),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.rocket,
            ),
            label: "Budget",
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "Profile",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: pages[_selectedIndex],
    );
  }
}
