import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(expense.title),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Text(
                'Rs. ${expense.amount.toStringAsFixed(2)}',
              ), //to string as fixed 12.3433 ->  12.33
              const Spacer(), // the space
              Row(
                children: [
                  Icon(categoryIcons[expense.category]),
                  const SizedBox(width: 8),
                  Text(
                    expense.formattedDate,
                  ),
                ],
              ),
            ],
          )
        ]),
      ),
    );
  }
}
