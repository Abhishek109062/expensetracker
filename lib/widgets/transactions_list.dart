// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_interpolation_to_compose_strings, sized_box_for_whitespace

import 'package:expensetracker/modules/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;

  TransactionList(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple, width: 2),
                  ),
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "₹" + transaction[index].amount.toStringAsFixed(2),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.purple),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction[index].title,
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      DateFormat.yMMMd().format(transaction[index].date),
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: transaction.length,
      ),
    );
  }
}
