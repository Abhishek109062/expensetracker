// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, use_key_in_widget_constructors, camel_case_types, sort_child_properties_last
import 'package:expensetracker/widgets/new_transaction.dart';
import 'package:expensetracker/widgets/transactions_list.dart';
import 'package:flutter/material.dart';

import 'modules/transaction.dart';

void main() {
  runApp(expense());
}

class expense extends StatefulWidget {
  @override
  State<expense> createState() => _expenseState();
}

class _expenseState extends State<expense> {
  final List<Transaction> transaction = [
    Transaction(
        id: 't1', amount: 30.99, date: DateTime.now(), title: "New Shoes"),
    Transaction(
        id: 't2', amount: 100, date: DateTime.now(), title: "Groceries"),
    Transaction(id: 't3', amount: 18.12, date: DateTime.now(), title: "Watch"),
    Transaction(id: 't4', amount: 49.49, date: DateTime.now(), title: "Tyre"),
    Transaction(id: 't5', amount: 20.12, date: DateTime.now(), title: "Snacks"),
    Transaction(id: 't6', amount: 56.67, date: DateTime.now(), title: "Fruits"),
  ];

  void addTransaction(String title, double price) {
    final obj = Transaction(
        id: DateTime.now().toString(),
        amount: price,
        date: DateTime.now(),
        title: title);

    setState(() {
      transaction.add(obj);
    });
  }

  void _startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expense Tracker'),
          actions: [
            IconButton(
              onPressed: () {
                _startNewTransaction(context);
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(4),
                width: double.infinity,
                child: Card(
                  color: Colors.blue,
                  child: Text("CHART"),
                  elevation: 5,
                ),
              ),
              TransactionList(transaction),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () => _startNewTransaction(context),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
