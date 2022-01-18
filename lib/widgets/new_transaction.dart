import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  const NewTransaction(this.addTx, {Key? key}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  var _selectedDate = DateTime.now();
  final _amountController = TextEditingController();

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(enteredTitle, enteredAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              // onChanged: (value) => titleInput = value,
              controller: _titleController,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
              // onChanged: (value) => amountInput = value,
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) {
                _submitData();
              },
            ),
            SizedBox(
              height: 70,
              child: Row(
                children: [
                  Text(DateFormat.yMMMd('es_ES').format(_selectedDate)),
                  TextButton(
                    onPressed: _presentDatePicker,
                    style: TextButton.styleFrom(primary: Colors.purple),
                    child: const Text('Seleccionar fecha',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  )
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () => _submitData(),
                style: ElevatedButton.styleFrom(primary: Colors.purple),
                child: const Text('Añadir transacción'))
          ]),
        ),
      ),
    );
  }
}
