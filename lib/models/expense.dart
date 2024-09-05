import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final dateFormatter = DateFormat.yMd();

const uuid = Uuid();

const categoryIcons = {
  ExpenseCategory.food: Icons.food_bank,
  ExpenseCategory.travel: Icons.flight_takeoff,
  ExpenseCategory.leisure: Icons.movie,
  ExpenseCategory.work: Icons.work,
};

enum ExpenseCategory {
  food,
  travel,
  leisure,
  work,
}

class Expense {
  // properties
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseCategory category;

  // getter
  String get formattedDate {
    return dateFormatter.format(date);
  }

  // constructor
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();
}

class ExpenseBucket {
  // properties
  final ExpenseCategory category;
  final List<Expense> expenses;

  // getter
  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }

  // constructor
  ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  // alternative named constructor
  ExpenseBucket.forCategory(
    List<Expense> allExpenses,
    this.category,
  ) : expenses = allExpenses
            .where((expnese) => expnese.category == category)
            .toList();
}
