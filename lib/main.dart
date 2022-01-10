import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'widgets/user_transactions.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(
              width: double.infinity,
              child: Card(
                child: Text(
                  "CHART",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            UserTransactions(),
          ],
        ),
      ),
    );
  }
}
