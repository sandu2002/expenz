import 'package:expenz/models/expence.model.dart';
import 'package:expenz/models/income_model.dart';
import 'package:expenz/utils/colors.dart';
import 'package:expenz/utils/constants.dart';
import 'package:expenz/widgets/custom_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/number_symbols_data.dart';

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

  ExpenseCategory _expenseCategory = ExpenseCategory.health;
  IncomeCategory _incomeCategory = IncomeCategory.salary;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  DateTime _selectedTime = DateTime.now();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selectedMethode == 0 ? kRed : kGreen,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              //expence and income toggle menu
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: kDefalutPadding, horizontal: kDefalutPadding),
                child: Container(
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
                              color: _selectedMethode == 1 ? kGreen : kWhite,
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
                ),
              ),
              //Amount feild
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefalutPadding,
                ),
                child: Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "How Much?",
                        style: TextStyle(
                          color: kLightGrey.withOpacity(0.8),
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextField(
                        style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: kWhite,
                        ),
                        decoration: InputDecoration(
                            hintText: "0",
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: kWhite,
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                            )),
                      )
                    ],
                  ),
                ),
              ),
              //User data form
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.3),
                decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(kDefalutPadding),
                  child: Form(
                    child: Column(
                      children: [
                        //category selector dropdowm
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100)),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: kDefalutPadding, horizontal: 20)),
                          items: _selectedMethode == 0
                              ? ExpenseCategory.values.map((Category) {
                                  return DropdownMenuItem(
                                      value: Category,
                                      child: Text(Category.name));
                                }).toList()
                              : IncomeCategory.values.map((Category) {
                                  return DropdownMenuItem(
                                      value: Category,
                                      child: Text(Category.name));
                                }).toList(),
                          value: _selectedMethode == 0
                              ? _expenseCategory
                              : _incomeCategory,
                          onChanged: (value) {
                            setState(() {
                              _selectedMethode == 0
                                  ? _expenseCategory = value as ExpenseCategory
                                  : _incomeCategory = value as IncomeCategory;
                            });
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        //title feild
                        TextFormField(
                          controller: _titleController,
                          decoration: InputDecoration(
                            hintText: "Title",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: kDefalutPadding, horizontal: 20),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        //description feild
                        TextFormField(
                          controller: _titleController,
                          decoration: InputDecoration(
                            hintText: "Description",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: kDefalutPadding, horizontal: 20),
                          ),
                        ),
                        //amount feild
                        SizedBox(
                          height: 20,
                        ),
                        //description feild
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: _titleController,
                          decoration: InputDecoration(
                            hintText: "Amount",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: kDefalutPadding, horizontal: 20),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        //date picker
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //Date picker
                            GestureDetector(
                              onTap: () {
                                showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2020),
                                        lastDate: DateTime(2026))
                                    .then((value) {
                                  if (value != null) {
                                    setState(() {
                                      _selectedDate = value;
                                    });
                                  }
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: kMainColor),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_month_outlined,
                                        color: kWhite,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Select Date",
                                        style: TextStyle(
                                          color: kWhite,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              DateFormat.yMMMd().format(_selectedDate),
                              style: TextStyle(
                                color: kGrey,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        //time picker
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //Date picker
                            GestureDetector(
                              onTap: () {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((value) {
                                  if(value != null){
                                    setState(() {
                                      _selectedTime = DateTime(
                                      _selectedDate.year,
                                      _selectedDate.month,
                                      _selectedDate.day,
                                      value.hour,
                                      value.minute,
                                    );
                                    });
                                  }
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: kYellow),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.lock_clock,
                                        color: kWhite,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Select Time",
                                        style: TextStyle(
                                          color: kWhite,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              DateFormat.jm().format(_selectedTime),
                              style: TextStyle(
                                color: kGrey,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),SizedBox(height: 20,),
                        Divider(
                          color: kLightGrey,
                          thickness: 5,
                        ),SizedBox(height: 20,),
                        CustumButton(
                          buttonName: "Add",
                          buttonColor:
                          _selectedMethode == 0 ? kRed : kGreen,)
                      ],
                    ),
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
