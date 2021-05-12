import './widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';
import './widgets/new_transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addTransaction);
        });
  }

  final List<Transaction> _userTransaction = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 250,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'New Fan',
      amount: 550,
      date: DateTime.now(),
    )
  ];

  void _addTransaction(String txtitle, double txamount) {
    final newTx = Transaction(
        title: txtitle,
        amount: txamount,
        date: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => startAddNewTransaction(context),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('CHART'),
              elevation: 5,
            ),
          ),
          TransactionList(_userTransaction)
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startAddNewTransaction(context),
      ),
    );
  }
}
