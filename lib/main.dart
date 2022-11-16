import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';
import 'package:counter_7/displayer/counter_7.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<DisplayerState>(create: (_) => DisplayerState()),
        ChangeNotifierProvider<DataModel>(create: (_) => DataModel()),
      ],
      child: MaterialApp(
        title: "TUGAS PBP",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const Counter7Displayer(),
      ),
    );
  }
}

class DisplayerState with ChangeNotifier {
  int _currDisplay = 0;
  int get getCurrDisplay => _currDisplay;

  void setCurrDisplay(int displayIndex) {
    _currDisplay = displayIndex;
    notifyListeners();
  }
}

class DataModel with ChangeNotifier {
  final List<dynamic> _list = [];
  List<dynamic> get getList => _list;

  void tambahBudget(Map budget) {
    _list.add(budget);
    notifyListeners();
  }
}
