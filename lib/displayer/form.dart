import 'package:counter_7/displayer/list.dart';
import 'package:counter_7/main.dart';
import 'package:provider/provider.dart';
import 'counter_7.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TambahBudgetDisplayer extends StatefulWidget {
  const TambahBudgetDisplayer({super.key});

  @override
  State<TambahBudgetDisplayer> createState() => _TambahBudgetDisplayerState();
}

class _TambahBudgetDisplayerState extends State<TambahBudgetDisplayer> {
  final _formKey = GlobalKey<FormState>();
  String _judulData = "";
  int _nominal = 0;

  String _pilihan = "Pilih Jenis";
  var _items = ["Pilih Jenis", "Pemasukan", "Pengeluaran"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Budget"),
      ),
      // Menambahkan drawer menu
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
                      builder: (context) => BudgetListDisplayer()),
                );
              },
            )
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                // Menggunakan padding sebesar 8 pixels
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: Pembelian Obat Maag",
                    labelText: "Title",
                    // Menambahkan icon agar lebih intuitif
                    icon: const Icon(Icons.book_outlined),
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // Menambahkan behavior saat nama diketik
                  onChanged: (String? value) {
                    setState(() {
                      _judulData = value!;
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      _judulData = value!;
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Judul Budget tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                // Menggunakan padding sebesar 8 pixels
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: 19000",
                    labelText: "Jumlah Nominal",
                    // Menambahkan icon agar lebih intuitif
                    icon: const Icon(Icons.attach_money_outlined),
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  // Menambahkan behavior saat nama diketik
                  onChanged: (String? value) {
                    setState(() {
                      _nominal = int.tryParse(value!)!;
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      _nominal = int.tryParse(value!)!;
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Nominal Budget tidak boleh kosong!';
                    }
                    if (int.tryParse(value)! == 0) {
                      return "Nominal Budget tidak boleh bernilai 0";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 200, left: 200),
                child: DropdownButtonFormField(
                  value: _pilihan,
                  hint: const Text("Pilih Jenis"),
                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  items: _items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _pilihan = newValue ?? "";
                    });
                  },
                  validator: (String? val) {
                    if (val == null || val.isEmpty || val == "Pilih Jenis") {
                      return "Tolong Pilih Jenis";
                    }
                  },
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white),
                    child: const Text(
                      "Simpan",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        var budgetData = {
                          "title": _judulData,
                          "nominal": _nominal,
                          "jenis": _pilihan,
                        };

                        Provider.of<DataModel>(context, listen: false)
                            .tambahBudget(budgetData);

                        _formKey.currentState?.reset();

                        setState(() {
                          _pilihan = "Pilih Jenis";
                        });

                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 15,
                              child: Container(
                                child: ListView(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 20),
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    Text(
                                        textAlign: TextAlign.left,
                                        "Judul: $_judulData"),
                                    Text(
                                        textAlign: TextAlign.left,
                                        "Nominal: $_nominal"),
                                    const SizedBox(height: 20),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Kembali"),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
