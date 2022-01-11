import 'widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'widgets/transaction_list.dart';
import 'models/transaction.dart';

void main() {
  initializeDateFormatting('es_ES').then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter App',
        home: MyHomePage(),
        theme: ThemeData(
          primarySwatch: Colors.purple,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
              .copyWith(secondary: Colors.deepPurple),
          fontFamily: 'Quicksand',
          textTheme: const TextTheme(
              headline6: TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // var titleInput = '';
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  final List<Transaction> _userTransactions = [
    // Transaction(
    //     id: 't1', title: 'Shoes', amount: 2312, date: DateTime(2019, 4, 1)),
    // Transaction(
    //     id: 't2',
    //     title: 'Weekly groceries',
    //     amount: 2312,
    //     date: DateTime.now()),
  ];

  void _addNewTransaction(String txTitle, int txAmount) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finanzas personales'),
        actions: [
          IconButton(
              icon: const Icon(Icons.add_rounded),
              onPressed: () => _startAddNewTransaction(context)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
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
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_rounded),
          onPressed: () => _startAddNewTransaction(context)),
    );
  }
}
