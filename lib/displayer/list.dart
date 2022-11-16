import 'package:counter_7/displayer/counter_7.dart';
import 'package:counter_7/displayer/form.dart';
import 'package:counter_7/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BudgetListDisplayer extends StatelessWidget {
  const BudgetListDisplayer({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic> list = Provider.of<DataModel>(context).getList;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Data Budget'),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              ListTile(
                title: const Text("counter_7"),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Counter7Displayer()),
                  );
                },
              ),
              ListTile(
                title: const Text("Tambah Budget"),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TambahBudgetDisplayer()),
                  );
                },
              ),
              ListTile(
                title: const Text("Data Budget"),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BudgetListDisplayer()),
                  );
                },
              )
            ],
          ),
        ),
        body: ListView(
            padding: const EdgeInsets.all(12),
            children: list
                .map((item) => SizedBox(
                    height: 88,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                )
                              ]),
                          child: Column(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                          child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 64),
                                        child: Text(item['title'],
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold)),
                                      )),
                                    ],
                                  )),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(item['nominal'].toString()),
                                      Text(
                                        item['jenis'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: item['jenis'] == "Pemasukan"
                                                ? Colors.green
                                                : Colors.red),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ))))
                .toList()));
  }
}
