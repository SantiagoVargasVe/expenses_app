import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'transaction.dart';
import 'package:intl/intl.dart';

void main() {
  initializeDateFormatting('es_ES').then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'Shoes', amount: 2312, date: DateTime(2019, 4, 1)),
    Transaction(
        id: 't2',
        title: 'Weekly groceries',
        amount: 2312,
        date: DateTime.now()),
  ];

  // var titleInput = '';
  // var amountInput = '';

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      body: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            child: Card(
              child: Text(
                "CHART",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Card(
              child: Container(
            padding: const EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
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
              ),
              TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(primary: Colors.purple),
                  child: const Text('Add Transaction'))
            ]),
          )),
          Column(
            children: transactions.map((tx) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        '\$${tx.amount}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tx.title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(DateFormat.yMMMMd("es-CO").format(tx.date),
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
