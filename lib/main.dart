import 'package:flutter/material.dart';
import 'package:operation_systems/data_sets.dart';
import 'package:operation_systems/widgets/table_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Операційні системи',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Операційні системи. Лабораторна робота №1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  final dataSet = DataSets();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _createDataSets() {
    widget.dataSet.init();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final intResults = widget.dataSet.intResultRaws;
    final doubleResults = widget.dataSet.doubleResultRaws;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TableWidget(results: intResults),
                SizedBox(height: 20),
                TableWidget(results: doubleResults),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createDataSets,
        tooltip: 'Запуск',
        child: const Icon(Icons.add),
      ),
    );
  }
}
