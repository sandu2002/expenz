//category enum

import 'package:flutter/material.dart';

enum IncomeCategory {
  freelance,
  salary,
  passive,
  sales,
}

//category images
final Map<IncomeCategory, String> incomeCategoryImages = {
  IncomeCategory.freelance: "https://cdn.pixabay.com/photo/2025/01/01/15/55/baby-9304011_640.jpg",
  IncomeCategory.passive: "https://cdn.pixabay.com/photo/2025/01/01/15/55/baby-9304011_640.jpg",
  IncomeCategory.sales: "https://cdn.pixabay.com/photo/2025/01/01/15/55/baby-9304011_640.jpg",
  IncomeCategory.salary: "https://cdn.pixabay.com/photo/2025/01/01/15/55/baby-9304011_640.jpg",
};

//category colors
final Map<IncomeCategory, Color> incomeCategoryColors = {
  IncomeCategory.freelance: const Color(0xFFE57373),
  IncomeCategory.passive: const Color(0xFF81C784),
  IncomeCategory.sales: const Color(0xFF64B5F6),
  IncomeCategory.salary: const Color(0xFFFFD54F),
};

final class Income {
  final int id;
  final String title;
  final double amount;
  final IncomeCategory category;
  final DateTime date;
  final DateTime time;
  final String description;

  Income({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    required this.time,
    required this.description,
  });

  // // Convert the Expense object to a JSON object
  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'title': title,
  //     'amount': amount,
  //     'category': category.index,
  //     'date': date.toIso8601String(),
  //     'time': time.toIso8601String(),
  //     'description': description,
  //   };
  // }

  // // Create an Expense object from a JSON object
  // factory Income.fromJson(Map<String, dynamic> json) {
  //   return Income(
  //     id: json['id'],
  //     title: json['title'],
  //     amount: json['amount'],
  //     category: IncomeCategory.values[json['category']],
  //     date: DateTime.parse(json['date']),
  //     time: DateTime.parse(json['time']),
  //     description: json['description'],
  //   );
  // }
}