import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTransaction;
  NewTransaction(this.addTransaction);

  void submitTransaction() {
      final enteredTitle = titleController.text;
      final enteredAmount = double.parse(amountController.text);
      
      if(enteredTitle.isEmpty || enteredAmount <= 0){
        return;
      }
      addTransaction(
        enteredTitle,
        enteredAmount,
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
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitTransaction,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitTransaction,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              onPressed: submitTransaction,
              textColor: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
