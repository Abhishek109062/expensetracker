// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  Function addTx;
  final titleController = TextEditingController();
  final priceController = TextEditingController();

  NewTransaction(this.addTx);

  void submitData() {
    final submittitle = titleController.text;
    final submitprice = double.parse(priceController.text);

    if (submittitle.isEmpty || submitprice < 0) return;

    addTx(
      submittitle,
      submitprice,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              controller: priceController,
              onChanged: (_) => submitData,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.purple,
                  backgroundColor: Colors.white),
              onPressed: submitData,
              child: Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
