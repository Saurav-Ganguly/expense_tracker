import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amtController = TextEditingController();
  DateTime? _selectedDate;
  Category? _selectedCategory = Category.leisure;
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      //await is used to show the value in future
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  //delete the controller when not in use
  @override
  void dispose() {
    _titleController.dispose();
    _amtController.dispose();
    super.dispose();
  }

  void _submitExpenseData() {
    final enteredAmt = double.tryParse(
        _amtController.text); //try parse return null if not possible
    final amountIsInvalid = enteredAmt == null || enteredAmt <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      // show a error message
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        TextField(
          controller: _titleController,
          maxLength: 50,
          decoration: const InputDecoration(
            label: Text("Expense Name"),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _amtController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  prefixText: 'Rs.',
                  label: Text("Amount"),
                ),
              ),
            ),
            //date picker
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _selectedDate == null
                        ? 'No date selected'
                        : formatter.format(_selectedDate!),
                  ),
                  IconButton(
                    onPressed: _presentDatePicker,
                    icon: const Icon(
                      Icons.calendar_month,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            DropdownButton(
              value: _selectedCategory,
              items: Category.values
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e.name.toUpperCase(),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value;
                });
              },
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                //closes the overlay
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: _submitExpenseData,
              child: const Text("Save Expense"),
            ),
          ],
        ),
      ]),
    );
  }
}