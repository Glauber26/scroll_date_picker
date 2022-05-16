import 'package:flutter/material.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

void main() {
  runApp(MaterialApp(home: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scroll Date Picker Example"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 100.0,
            alignment: Alignment.center,
            child: Text(
              "$_selectedDate",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 48),
            child: TextButton(
              onPressed: () {
                setState(() {
                  _selectedDate = DateTime.now();
                });
              },
              child: Text(
                "TODAY",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
          Container(
            color: Colors.transparent,
            height: 200,
            //width: MediaQuery.of(context).size.width,
            child: ScrollDatePicker(
              indicator: Container(
                height: 20,
                width: 0,
              ),
              localeOptions: DatePickerLocaleOptions(
                monthWidth: 140,
                monthAlignment: Alignment.center,
              ),
              minimumDate: DateTime.now().subtract(Duration(days: 36500)),
              maximumDate: DateTime.now().add(Duration(days: 36500)),
              options: DatePickerOptions(itemExtent: 25),
              style: DatePickerStyle(
                selectedTextStyle: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
                textStyle: TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              verticalDivider: SizedBox(
                height: 130,
                child: VerticalDivider(
                  color: Colors.black,
                  thickness: 1,
                ),
              ),
              selectedDate: _selectedDate,
              locale: DatePickerLocale.ptBR,
              onDateTimeChanged: (DateTime value) {
                setState(() {
                  _selectedDate = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
