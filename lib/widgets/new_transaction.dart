import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addTx;

  NewTransaction(this.addTx, {Key? key}) : super(key: key);

  void submitData(BuildContext context) {
    const snackBar = SnackBar(content: Text('Invalid Input'));
    try {
      final enteredTitle = titleController.text;
      final enteredAmount = int.parse(amountController.text);

      if (enteredTitle.isEmpty || enteredAmount <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return;
      }

      addTx(enteredTitle, enteredAmount);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
            // onChanged: (value) => titleInput = value,
            controller: titleController,
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Amount',
            ),
            // onChanged: (value) => amountInput = value,
            controller: amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) {
              submitData(context);
            },
          ),
          TextButton(
              onPressed: () => submitData(context),
              style: TextButton.styleFrom(primary: Colors.purple),
              child: const Text('Add Transaction'))
        ]),
      ),
    );
  }
}
