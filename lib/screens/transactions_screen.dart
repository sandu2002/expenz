import 'package:flutter/material.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactiosScreenState();
}

class _TransactiosScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(title: Text("Transactios Page"),),);
  }
}